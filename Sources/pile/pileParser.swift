import Foundation


func parsePile() -> [Block] {
    var blocks = [Block]()
    for file in getAllMarkdownFilesInDirectory(getRootDir()) {
        blocks.append(contentsOf: parseFile(file))
    }
    return blocks
}

func parseFile(_ fileURL: URL) -> [Block] {
    do {
        let fileContent = try String(contentsOf: fileURL)
        let blockStrings = fileContent.components(separatedBy: "\n\n")
        var blocks = [Block]()
        var headingStack = Stack<Block>()
        // TODO add check that first block would be H1
        print(blockStrings)
        for bStr in blockStrings {
            let lastHeadingLevel = headingStack.count
            let currentHeadingLevel = determineHeadingLevel(bStr)

            if bStr.words().count == 0 {
                print("STYLE WARNING: too many blank lines")
                continue
            }
            print("currentHeadingLevel: \(currentHeadingLevel), stack has \(headingStack.storage)")
            let currentBlock = Block(parent: nil,
                    type: determineHeadingLevel(bStr) == 0 ? .paragraph : .section,
                    path: fileURL.path, body: bStr, tags: parseTags(bStr))
            if currentBlock.type == .section {
                currentBlock.parent = currentHeadingLevel < 2 ? nil : headingStack.storage[currentHeadingLevel - 2]
            } else if currentBlock.type == .paragraph {
                currentBlock.parent = blocks.last
            } else {
                print("UNHANDLED!")
            }
            blocks.append(currentBlock)
            // E.g. one ## is over and another ## starts
            if currentHeadingLevel == lastHeadingLevel {
                headingStack.replaceLast(currentBlock)
            }
            // E.g. under a higher ## there is a smaller ###
            else if currentHeadingLevel == lastHeadingLevel + 1 {
                headingStack.push(currentBlock)
            }
            // E.g. An #### is over and a new ## starts
            else if currentHeadingLevel < lastHeadingLevel {
                headingStack.preserveFirst(determineHeadingLevel(bStr))
            } else {
                print("MARKDOWN ERROR: a \(currentHeadingLevel). level heading cannot follow a \(lastHeadingLevel). level heading.")
            }
        }
        return blocks
    } catch {
        print(error)
        return []
    }
}

func parseTags(_ block: String) -> [String] {
    block.words().filter {
        $0.matches(#"^#\w+$"#)
    }
}

func determineHeadingLevel(_ block: String) -> Int {
    let words = block.words()
    let lineCount = block.components(separatedBy: "\n").count
    if lineCount != 1 || words.count < 1 || !words[0].isSequenceOf("#") {
        return 0
    }
    return words[0].count

}
