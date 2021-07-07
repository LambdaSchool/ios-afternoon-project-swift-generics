import Foundation

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    private var storage = [Element: Int]()
    
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            self.insert(element)
        }
    }
    
    subscript(element: Element) -> Int {
        get {
            return storage[element] ?? 0
        }
    }
    
    mutating func insert(_ element: Element) {
        storage[element, default: 0] += 1
    }

    mutating func remove(_ element: Element) -> Int {
        // check if it's not empty
        guard let count = storage[element] else { return 0 }
        storage[element] = count - 1
        
        // remove if it's 0
        if storage[element] == 0 {
            storage.removeValue(forKey: element)
        }
        
        return storage[element] ?? 0
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
