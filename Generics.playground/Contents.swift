import UIKit

var str = "Hello, playground"

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    var dictionary : [Element: Int] = [:]
    
    init(arrayLiteral elements: Element...) {
    
        for element in elements {
            self.insert(element)
        }
    }
    
    mutating func insert(_ element: Element) {
        dictionary[element] = (dictionary[element] ?? 0) + 1
    }
    
    mutating func remove(_ element: Element) -> Int{
        var count = dictionary[element] ?? 0
        
        if count > 0 {
            dictionary[element] = count - 1
            count -= 1
        }
        return count
    }
    
    func count() -> Int {
        if dictionary.isEmpty == false { return 0 } else {
            return dictionary.count
        }
    }
    
    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0
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
myCountedSet.count()
myCountedSet.insert(.magic)
myCountedSet.insert(.iron)
myCountedSet[.magic]
myCountedSet[.iron]









