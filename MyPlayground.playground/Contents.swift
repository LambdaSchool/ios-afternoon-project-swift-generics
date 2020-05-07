import Foundation

struct CountedSet<Element: Hashable> {
    
    private var dictionary = [Element: Int]()
    
    mutating func insert( _ member: Element) {
        if var _ = dictionary[member] {
            dictionary[member]! += 1
        } else {
            dictionary[member] = 1
        }
    }
    
    mutating func remove( _ member: Element) {
        if var _ = dictionary[member] {
            dictionary[member]! -= 1
        } else {
            dictionary[member] = 0
        }
    }
    
    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0
    }
    
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.init()
        for element in elements {
            self.dictionary[element] = (dictionary[element] ?? 0) + 1
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

myCountedSet.insert(.iron)
//struct Animal {
//    var numberOfLegs: Int
//}
//
//let animals: [Animal] = [Animal(numberOfLegs: 1), Animal(numberOfLegs: 5)]
//print(animals)
