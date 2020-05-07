import Foundation



struct CountedSet<Element : Hashable> {
    
    private var dictionarySet: [Element: Int] = [:]
    
    mutating func insert(value: Element) {
        if dictionarySet[value] != nil {
            dictionarySet[value]! += 1
        } else {
            dictionarySet = [value : 1]
        }
    }
    
    mutating func remove(value: Element) {
        dictionarySet[value]! -= 1
    }
    
    subscript(_ member: Element) -> Int {
        return dictionarySet[member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            dictionarySet[element] = (dictionarySet[element] ?? 0) + 1
//            self.insert(value: element)
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(value: .iron) // 3
myCountedSet[.iron]
myCountedSet.insert(value: .iron)
myCountedSet[.iron]
myCountedSet[.silver]
//myCountedSet.remove(value: .dwarvish) // 0
//myCountedSet.remove(value: .magic) // 0
