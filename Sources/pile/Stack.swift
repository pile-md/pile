// Inspired by https://stackoverflow.com/a/60011232/9035706
struct Stack<Element> {
    // TODO make private
    var storage = [Element]()

    func peek() -> Element? {
        storage.last
    }

    mutating func push(_ element: Element) {
        storage.append(element)
    }

    @discardableResult mutating func pop() -> Element? {
        storage.popLast()
    }

    mutating func replaceLast(_ element: Element) {
        pop()
        push(element)
    }

    var count: Int {
        storage.count
    }

    mutating func preserveFirst(_ count: Int) {
        let removedElementsCount = storage.count - count
        for _ in 0..<removedElementsCount {
            pop()
        }
    }
}
