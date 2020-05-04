import UIKit

struct CountedSet<T: Hashable>: ExpressibleByArrayLiteral {
    
    init(arrayLiteral: T...) {
        for element in arrayLiteral {
            let count = (elements[element] ?? 0) + 1
            elements.updateValue(count, forKey: element)
        }
    }
    
    
    private(set) var elements: [T: Int] = [T: Int]()
    
    mutating func insert(element: T) {
        let count = (elements[element] ?? 0) + 1
        elements[element] = count
    }
    
    mutating func remove(_ element: T) {
        let count = (elements[element] ?? 0) - 1
        if count < 0 {
            elements.removeValue(forKey: element)
        } else {
            elements[element] = count
        }
    }
    
    subscript(_ member: T) -> Int {
        get {
            return elements[member] ?? 0
        }
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
myCountedSet[.iron]



