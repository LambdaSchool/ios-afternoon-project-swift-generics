import UIKit


struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
    
    var dict: [Element: Int] = [:]
    
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element)
        }
    }
    
    mutating func insert(_ element: Element) {
        dict[element] = (dict[element] ?? 0) + 1
    }
    
    mutating func remove(_ element: Element) -> Int{
        var count = dict[element] ?? 0
        
        if count > 0 {
            dict[element] = count - 1
            count -= 1
        }
        return count
    }
    
    func count() -> Int {
        guard !dict.isEmpty else { return 0 }
        
        return dict.count
    }
    
    subscript(_ member: Element) -> Int {
        return dict[member] ?? 0
    }
    
    
} // CounteSet


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var aCountedSet = CountedSet<Arrow>()

aCountedSet[.iron] // 0

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
print(myCountedSet[.iron])

myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
print(myCountedSet[.iron])

myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
