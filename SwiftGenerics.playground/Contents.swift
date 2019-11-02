import UIKit




struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral{
    
    typealias ArrayLiteralElement = Element
    
    
    private(set) var dictionary = [Element:Int]()
    
    mutating func insert(_ member: Element) {
        dictionary[member] = (dictionary[member] ?? 0) + 1
    }
    
    mutating func remove(_ member: Element) {
        let count: Int = dictionary[member] ?? 0
        if count > 0 {
            dictionary[member] = count - 1
        }
    }

    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0
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
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
