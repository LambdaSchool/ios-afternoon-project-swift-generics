import Foundation

struct CountedSet<Element: Hashable> {

    private(set) var element: [Element: Int] = [:]

    mutating func insert(_ member: Element) {
        element[member, default: 0] += 1
    }

    mutating func remove(_ member: Element) -> Int? {
        guard var count = element[member], count > 0 else { return nil}

        count -= 1
        element[member] = count == 0 ? nil : count
        return count
    }

    subscript(_ member: Element) -> Int {
        return element[member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    init<S: Sequence>(_ sequence: S) where S.Element == Element {
        self.element = sequence.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    }

    init(arrayLiteral element: Element...) {
        self.init(element)
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
