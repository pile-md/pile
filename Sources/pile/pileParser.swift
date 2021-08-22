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
        return blockStrings.map {
            Block(parent: nil, type: .paragraph, path: fileURL.path, body: $0, tags: parseTags($0))
        }
    } catch {
        print(error)
        return []
    }
}

func parseTags(_ block: String) -> [String] {
    breakIntoWords(block).filter {
        $0.matches(#"^#\w+$"#)
    }
}

func determineHeadingLevel(_ block: String) -> Int {
    let words = breakIntoWords(block)
    let lineCount = block.components(separatedBy: "\n").count
    if lineCount != 1 || words.count < 1 || !words[0].isSequenceOf("#") {
        return 0
    }
    return words[0].count

}

func breakIntoWords(_ block: String) -> [String] {
    block.replacingOccurrences(of: "\n", with: " ").components(separatedBy: " ")
}