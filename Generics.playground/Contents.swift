import UIKit
import Foundation

enum Arrow {case iron, wooden, elven, dwarvish, magic, silver}

struct CountedSet<Element: Hashable> {
    private var dictionary: [Element: Int] = [:]
    
    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0
    }
    
    mutating func insert(_ element: Element) {
        if let elements = dictionary[element] {
            dictionary[element] = elements + 1
        } else {
            dictionary.updateValue(1, forKey: element)
        }
    }
    
    mutating func remove(_ element: Element) -> Int {
        if dictionary.count > 0 {
            dictionary.removeValue(forKey: element)
            return dictionary[element] ?? 0
        } else {
            (print("No elements in dictionary"))
            return 0
        }
    }
    
    func count() -> Int {
        var total: Int = 0
        for (_, uniqueElements) in dictionary {
            total += uniqueElements
        }
        return total
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            insert(element)
        }
    }
}

var aCountedSet = CountedSet<Arrow>()

aCountedSet[.iron]
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron]
myCountedSet.remove(.iron)
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)

