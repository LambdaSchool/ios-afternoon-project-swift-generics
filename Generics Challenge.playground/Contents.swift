import UIKit


struct CountedSet<Element: Hashable> {

    private var storage: [Element: Int] = [:]

    mutating func insert(_ element: Element) {

        if let count = storage[element] {
            storage[element] = count + 1
        } else {
            storage[element] = 1
        }
    }

    mutating func remove(_ element: Element) {

        if let count = storage[element] {
            if count > 1 {
                storage[element] =  count - 1
            } else {
                storage[element] = nil
            }
        }
    }

    subscript(_ element: Element) -> Int {

    if let count = storage[element] {
        return count
    } else {
        return 0
        }
    }

    var count: Int {
        return storage.count
    }

    var isEmpty: Bool {
        return storage.isEmpty
    }
}

extension CountedSet: ExpressibleByArrayLiteral {

    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

enum Arrow { case iron,
    wooden,
    elven,
    dwarvish,
    magic,
    silver }

var aCountedSet = CountedSet<Arrow>()

aCountedSet[.iron] // 0

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0





