import UIKit

struct CountedSet<Element: Hashable> {
    
    private var dictionary: [Element: Int] = [:]
    
    mutating func insert(_ entry: Element) {
        if let place = dictionary[entry] {
            dictionary[entry] = place + 1
        } else {
            dictionary[entry] = 1
        }
    }
    
    //  remove a value from dictionary; return an Int.
    mutating func remove(_ element: Element) -> Int {
        guard let place = dictionary[element] else { return 0 }
        
        if place > 0 {
            dictionary[element]! -= 1
        } else {
            dictionary.removeValue(forKey: element)
        }
        return dictionary[element] ?? 0
    }
    
    func count(_ number: Element) -> Int {
        return dictionary[number] ?? 0
        }
    
    func isEmpty(_ set: Element) -> Bool {
        return count(set) == 0
    }
    
    subscript(_ value: Element) -> Int {
        if let result = dictionary[value] {
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

enum Arrow {
    case iron
    case wooden
    case elven
    case dwarvish
    case magic
    case silver
}

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron]
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron]
myCountedSet.remove(.iron)
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)
