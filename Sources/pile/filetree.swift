import Foundation

func getAllMarkdownFilesInDirectory(_ rootDir: URL) -> [URL] {
    getAllFilesInDirectory(rootDir).filter {
        $0.path.hasSuffix(".md")
    }
}

// Inspired by https://stackoverflow.com/a/57640445/9035706
func getAllFilesInDirectory(_ rootDir: URL) -> [URL] {
    var files = [URL]()
    if let enumerator = FileManager.default.enumerator(at: rootDir,
            includingPropertiesForKeys: [.isRegularFileKey], options: [.skipsHiddenFiles, .skipsPackageDescendants]) {
        for case let fileURL as URL in enumerator {
            do {
                let fileAttributes = try fileURL.resourceValues(forKeys: [.isRegularFileKey])
                if fileAttributes.isRegularFile! {
                    files.append(fileURL)
                }
            } catch {
                print(error, fileURL)
            }
        }
    }
    return files
}