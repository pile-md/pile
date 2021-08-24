import Foundation

class Block {
    var parent: Block?
    var children = [Block]()
    let type: BlockType
    let path: String
    let body: String
    let tags: [String]

    init(parent: Block?, type: BlockType, path: String, body: String, tags: [String]) {
        self.parent = parent
        self.type = type
        self.path = path
        self.body = body
        self.tags = tags
    }

    var fullBody: String {
        let childBodies = children.map {$0.fullBody}
        var result = body
        for c in childBodies {
            result += "\n\n"
            result += c
        }
        return result
    }
}

enum BlockType {
    case section
    case paragraph
}