import Foundation

func getRootDirName() -> URL {
    var dir = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    while true {
        do {
            let dirContent = try FileManager.default.contentsOfDirectory(atPath: dir.path)
            if dirContent.contains(".pile") {
                 return dir
            }
            dir = dir.deletingLastPathComponent()
        } catch {
            print(error)
        }
    }
    return dir
}
