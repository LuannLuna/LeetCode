import Foundation

//Example 1:
//Input: s = "()"
//Output: true
//
//Example 2:
//Input: s = "()[]{}"
//Output: true
//
//Example 3:
//Input: s = "(]"
//Output: false

struct Queue<T> {
    private var elements: [T] = []

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    mutating func enqueue(_ element: T) {
        elements.append(element)
    }

    mutating func dequeue() -> T? {
        isEmpty ? nil : elements.removeLast()
    }

    func peek() -> T? {
        elements.first
    }

    mutating func clear() {
        elements.removeAll()
    }
}

class Solution {

    private
    enum Openers: Character {
        case parenteses = "("
        case chaves = "{"
        case cochete = "["
    }

    private
    enum Closers: Character {
        case parenteses = ")"
        case chaves = "}"
        case cochete = "]"
    }

    private
    func isTheSame(_ lhs: Openers, rhs: Closers) -> Bool {
        switch lhs {
            case .parenteses:
                return rhs == .parenteses
            case .chaves:
                return rhs == .chaves
            case .cochete:
                return rhs == .cochete
        }
    }

    func isValid(_ s: String) -> Bool {
        guard s.count.isMultiple(of: 2) else { return false }
        var queue = Queue<Character>()
        for c in s {
            if let opener = Openers(rawValue: c) {
                queue.enqueue(c)
                continue
            }
            if let closer = Closers(rawValue: c) {
                if let value = queue.dequeue(),
                   let opener = Openers(rawValue: value) {
                    if !isTheSame(opener, rhs: closer) {
                        return false
                    } else {
                        continue
                    }
                }
            }
            return false
        }
        return queue.isEmpty
    }
}