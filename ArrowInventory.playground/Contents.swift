import Foundation
import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var storage = [Element:Int]()
}

//----------------------------------------------------------------



enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()

aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0



//----------------------------------------------------------------
extension CountedSet {
    mutating func insert(element: Element) {
        storage[element] = (storage[element] ?? 0) + 1
    }
    
    mutating func remove(_ element: Element) {
        let count = (storage[element] ?? 0)
        if count > 0 {
            storage[element] = count - 1
        }
    }
}
extension CountedSet {
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
}
extension CountedSet {
    var count: Int? {
        if storage.count == 0 {
            return nil
        }
        return storage.count
    }
}
extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    init(arrayLiteral elements: Element...) {
        for element in elements {
            storage[element] = (storage[element] ?? 0) + 1
        }
    }
}
