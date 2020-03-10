import UIKit

struct CountedSet<T: Hashable>: ExpressibleByArrayLiteral {
    
    init(arrayLiteral: T...) {
        for element in arrayLiteral {
            var count = 0
            if let theElement = elements[element] {
                count = theElement
            }
            count += 1
            elements[element] = count
        }
    }
    
    
    private(set) var elements: [T: Int] = [T: Int]()
    
    mutating func insert(element: T) -> Int {
        if let myElement = elements[element] {
            let count = myElement + 1
            elements.updateValue(count, forKey: element)
            return count
        } else {
            elements[element] = 1
            return 1
        }
        
    }
    
    mutating func remove(_ element: T) -> Int {
        if let myElement = elements[element] {
            if myElement == 1 {
                elements.removeValue(forKey: element)
                return 0
            } else {
                let count = myElement - 1
                elements.updateValue(count, forKey: element)
                return count
            }
            
        }
        return 0
    }
    
    subscript(_ member: T) -> Int {
        get {
            return elements[member] ?? 0
        }
        set {
            var count = 0
            if let theElement = elements[member] {
                count = theElement
            }
            count += 1
            elements[member] = count
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



