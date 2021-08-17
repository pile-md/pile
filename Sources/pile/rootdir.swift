import Foundation

func getRootDirName() -> String {
    var dir = FileManager.default.currentDirectoryPath
    while true {
        do {
            let dirContent = try FileManager.default.contentsOfDirectory(atPath: dir)
            if dirContent.contains(".pile") {
                 return dir
            }
            dir = URL(fileURLWithPath: dir).deletingLastPathComponent().path
        } catch {
            print(error)
        }
    }
    return dir
}
