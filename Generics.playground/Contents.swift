import UIKit

// need to take a set of elements hold them in a dictionary in memory that keeps track of how many of each element in the set that we have

struct CountedSet<Element: Hashable> {
    
    private (set) var elements: [Element: Int] = [:]
    
    mutating func insert(_ element: Element) {
        // add whatever value is inserted to the dictionary and the value of the dictionary is how many times it's there
        // if this doesn't exist add it w/ a value of one if it exists add one to the value
        if let _ = elements[element] {
            elements[element]! += 1
        } else {
            elements[element]! = 1
        }
    }
    
    mutating func remove(_ element: Element) -> Int {
        //remove a value from the dictory and change the value of the dictionary to show how many of the element are in the set
        
        guard let count = elements[element] else { return 0 }
        
        if count > 0 {
             elements[element]! -= 1
        } else {
            elements.removeValue(forKey: element)
        }
        
        return elements[element] ?? 0
    }
    
    subscript(_ member: Element) -> Int {
        return elements[member] ?? 0
    }
    

}


extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elementsArray: Element...) {
        for element in elementsArray {
            elements[element] = (elements[element] ?? 0) + 1
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

