import Foundation

class Block {
    var parent: Block?
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
}

enum BlockType {
    case section
    case paragraph
}