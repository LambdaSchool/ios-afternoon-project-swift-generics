import UIKit
import Foundation

enum Arrow {
    case iron, wooden, elven, dwarvish, magic, silver }

struct CountedSet<Element: Hashable> {
    
    var dictionary = [Element : Int]()
    
    mutating func insert(_ element: Element) {
        dictionary[element] = (dictionary[element] ?? 0) + 1
    }
    
    mutating func remove(_ element: Element) {
        // create a count property
        let count = dictionary[element] ?? 0
        // check to make sure dictionary isn't empty
        if count == 0 {
            print(dictionary[element] ?? 0)
        } else {
            // if it not empty remove the following element
            dictionary.updateValue(count - 1, forKey: element)
            print(dictionary[element] ?? 0)
        }
    }
    
    mutating func count() -> Int {
        return dictionary.keys.count
    }
    
    subscript(_ element: Element) -> Int {
        print(dictionary[element] ?? 0)
        return dictionary[element] ?? 0
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


var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron]
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron, .dwarvish, .wooden, .dwarvish, .wooden, .wooden, .dwarvish]
myCountedSet[.iron]
myCountedSet.remove(.iron)
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)
myCountedSet.dictionary
myCountedSet.count()
myCountedSet[.dwarvish]
