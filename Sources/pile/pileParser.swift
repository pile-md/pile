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
            Block(path: fileURL.path, body: $0, tags: parseTags($0))
        }
    } catch {
        print(error)
        return []
    }
}

func parseTags(_ block: String) -> [String] {
    let words = block.replacingOccurrences(of: "\n", with: " ").components(separatedBy: " ")
    return words.filter {$0.matches(#"^#\w+$"#)}
}