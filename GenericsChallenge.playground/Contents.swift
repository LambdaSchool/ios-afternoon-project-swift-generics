import UIKit

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
    private(set) var storage = [Element: Int]()
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            storage[element] = (storage[element] ?? 0) + 1
        }
    }
    
    mutating func insert(_ element: Element) -> Int {
        storage[element] = self[element] + 1
        return self[element]
    }
    
    mutating func remove(_ element: Element) {
        let count = storage[element] ?? 0
        
        if count > 0 {
            storage[element] = count - 1
        }
    }
    
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
    
    func count() -> Int {
        if storage.count == 0 {
            return 0
        } else {
            return storage.count
        }
    }
    
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
aCountedSet.insert(.iron)
aCountedSet[.iron]
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
myCountedSet[.silver]
myCountedSet.insert(.dwarvish)
myCountedSet[.dwarvish]
