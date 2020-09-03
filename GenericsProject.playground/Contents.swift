import UIKit

struct CountedSet<Element: Hashable> {

    private var elements = [Element: Int]()

    var count: Int {
        return elements.count
    }

    var isEmpty: Bool {
        return count == 0
    }

    mutating func insert(_ element: Element) {
        if let elementCount = elements[element] {
            elements[element] = elementCount + 1
        } else {
            elements[element] = 1
        }
    }

    mutating func remove(_ element: Element) {
        guard let elementCount = elements[element] else { return }

        if elementCount > 1 {
            elements[element] = elementCount - 1
        } else {
            elements[element] = nil
        }
    }

    subscript(_ member: Element) -> Int {
        return elements[member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

extension CountedSet {
    func contains(_ element: Element) -> Bool {
        return elements.keys.contains(element)
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron]      // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron]     // 4
myCountedSet.remove(.iron)
myCountedSet[.iron]     // 3
myCountedSet.remove(.dwarvish)
myCountedSet[.dwarvish] // 0
myCountedSet.remove(.magic)
myCountedSet[.magic]    // 0

