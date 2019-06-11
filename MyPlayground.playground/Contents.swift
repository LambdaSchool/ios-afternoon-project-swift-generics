import Cocoa

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            self.insert(element)
        }
    }
    
    private var countDictionary: [Element: Int] = [:]
    
    mutating func insert(_ element: Element) {
        if let count = countDictionary[element] {
            countDictionary[element] = count + 1
        } else {
            countDictionary.updateValue(1, forKey: element)
        }
    }
    
    mutating func remove(_ element: Element) {
        if let count = countDictionary[element] {
            if count != 0 {
                countDictionary[element] = count - 1
            } else {
                countDictionary.removeValue(forKey: element)
            }
        }
    }
    
    
    subscript(element: Element) -> Int? {
        return countDictionary[element] ?? 0
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
