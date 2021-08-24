extension Collection {

    func get(index: Index) throws -> Element? {
        if !indices.contains(index) {
            throw OutOfBounds(message: "Cannot access index \(index) in \(self)")
        }
        return self[index]
    }

    subscript(optional index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

struct OutOfBounds: Error {
    let message: String
}