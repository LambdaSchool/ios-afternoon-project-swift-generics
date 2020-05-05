import UIKit

struct CountedSet<Element: Hashable> {

    private var dictionary: [Element: Int] = [:]
    
    mutating func insert(_ member: Element) {
        if let count = dictionary[member] {
            dictionary[member] = count + 1
        } else {
            dictionary[member] = 1
        }
    }

    mutating func remove(_ element: Element) {
        if let count = dictionary[element] {
            if count > 0 {
                dictionary[element] = count - 1
            }
        }

    func count (_ member: Element) -> Int {
            return dictionary[member] ?? 0
        }
        func isEmpty(_ member: Element) -> Bool {
            return count(member) == 0
        }
    }

    subscript(_ member: Element) -> Int {
        if let result = dictionary[member] {
            return result
        } else {
            return 0
        }
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            insert(element)
        }
    }
}


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0

var myCountedSet:CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0










