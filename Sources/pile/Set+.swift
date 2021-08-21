extension Set {
    mutating func insert(_ arr: [Element]) {
        for elem in arr {
            self.insert(elem)
        }
    }
}