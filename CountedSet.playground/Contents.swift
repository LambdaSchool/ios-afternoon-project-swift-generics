import Foundation

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

struct CountedSet<Element: Hashable> {
    
    var backingDictionary = [Element: Int]()
    var count: Int = 0
    //    var uniqueDictionary: [Element: Int] = () {
    //        didSet{
    //            removeDuplicates(dictionary: backingDictionary)
    //        }
    //    }
    
    mutating func insertElement(_ element: Element) {
   
            if backingDictionary.keys.contains(element){
                backingDictionary[element] = count + 1
                return
            } else {
                backingDictionary[element] = 1
                return
            }
    }
    
    mutating func remove(_ element: Element) {
        backingDictionary.removeValue(forKey: element)
        let count = backingDictionary[element] ?? 0
        if count > 0 {
            backingDictionary[element] = count - 1
        }
    }
    
    subscript(_ member: Element) -> Int {
        if let value = backingDictionary[member] {
            return value
        } else {
            return 0
        }
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            backingDictionary[element] = (backingDictionary[element] ?? 0) + 1
        }
    }
}

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
myCountedSet.insertElement(.dwarvish)

