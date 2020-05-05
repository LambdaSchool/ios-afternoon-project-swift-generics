//: [Previous](@previous)

import Foundation
import UIKit

struct CountedSet<Element: Hashable> {
    
    private(set) var elementDictionary: [Element: Int] = [:]
    
    var count: Int {
        return elementDictionary.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func insert(_ element: Element) {
        if let elementCount = elementDictionary[element] {
            elementDictionary[element] = elementCount + 1
        } else {
            elementDictionary[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) -> Int?  {
        guard let elementCount = elementDictionary[element] else { return 0 }
        
        if elementCount > 1 {
            elementDictionary[element] = elementCount - 1
        } else {
            elementDictionary.removeValue(forKey: element)
        }
        
        return elementCount
    }
    
    subscript(_ member: Element) -> Int  {
         return elementDictionary[member] ?? 0
    }
     
}

extension CountedSet: ExpressibleByArrayLiteral {
   typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            self.insert(element)
        }
    }
}

extension CountedSet {
    func contains(_ element: Element) -> Bool {
        return elementDictionary.keys.contains(element)
    }
}


//MARK: - Enum for supported interaction
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
aCountedSet.insert(.magic)
aCountedSet.insert(.silver)
print(aCountedSet.count)
print(aCountedSet.contains(.magic))

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.count
myCountedSet.remove(.dwarvish) // 0
myCountedSet.count
myCountedSet.remove(.magic) // 0


//: [Next](@next)
