//: [Previous](@previous)

import Foundation

struct CountedSet<Element: Hashable> {
    
    private(set) var elementDictionary = [Element: Int]()
    
    var count: Int {
        return elementDictionary.count
    }
    
    mutating func insert(_ element: Element) {
        if let elementCount = elementDictionary[element] {
            elementDictionary[element] = elementCount + 1
        } else {
            elementDictionary[element] = 0
        }
    }
    
    mutating func remove(_ element: Element)  {
        guard let elementCount = elementDictionary[element] else { return }
        
        if elementCount > 1 {
            elementDictionary[element] = elementCount - 1
        } else {
            elementDictionary[element] = nil
        }
//        return element.self
    }
    
    subscript(_ member: Element) -> Int  {
         return elementDictionary[member] ?? 0
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
        return elementDictionary.keys.contains(element)
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



//: [Next](@next)
