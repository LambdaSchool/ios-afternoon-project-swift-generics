import UIKit

// Counted Set

struct CountedSet<T: Hashable>: Hashable {
    private var dictionary: [T: Int] = [:]
    
    mutating func insert(_ item: T) {
        dictionary[item] = self[item] + 1
    }
    
    mutating func remove(_ item: T) {
        if self[item] > 0 {
            dictionary[item]! -= 1
        }
    }
    
    subscript(_ member: T) -> Int {
        get {
            return dictionary[member] ?? 0
        }
        
        set(value) {
            dictionary[member] = value
        }
    }
}

// Test

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
aCountedSet.insert(.iron)
aCountedSet[.iron]
aCountedSet[.iron] = 5
aCountedSet[.iron]
aCountedSet.remove(.iron)
aCountedSet[.iron]

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
