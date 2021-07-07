import Foundation

    // Create a generic CountedSet struct that is constrained to Hashable elements.

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    
    // Use a private dictionary as your backing storage for set members and their counts.
    private(set) var storage = [Element: Int]()
    
    // Array Literal
    init(arrayLiteral elements: Element...) {
        
        for element in elements {
            storage[element] = (storage[element] ?? 0) + 1
        }

    }

    // Support subscripting to look up current values (by implementing subscript(_ member: Element) -> Int). Return 0 for any value that is not found.
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
    
    // Add count, returning the number of unique elements in the counted set and isEmpty for when count is zero.
    func count() -> Int {
        if storage.count == 0 {
            return 0
        } else {
        return storage.count
        }
    }

    // Insert Func
    
    mutating func insert(_ element: Element) {
        storage[element] = (storage[element] ?? 0) + 1
    }
    
    // Remove Func
    mutating func remove(_ element: Element) {
        
        let count = storage[element] ?? 0
        
        if count > 0 {
            storage[element] = count - 1
        }
    }
}


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.count()
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
myCountedSet.insert(.elven) // 1

