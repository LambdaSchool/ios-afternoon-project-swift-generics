import Cocoa

// Create a generic CountedSet struct that is constrained to Hashable elements.

struct CountedSet<Element: Hashable> {
    private(set) var storage = [Element:Int]()
}

// Add insertion and removal (insert and remove) of one element at a time.

extension CountedSet {
    mutating func insert(element: Element) {
        storage[element] = (storage[element] ?? 0) + 1
    }
    
    mutating func remove(_ element: Element) {
        let count = (storage[element] ?? 0)
        if count > 0 {
            storage[element] = count - 1
        }
    }
}

// Support subscripting to look up current values. Return 0 for any value that is not found.

extension CountedSet {
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
}

//enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
//var aCountedSet = CountedSet<Arrow>()
//aCountedSet[.iron] // 0
//var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
//myCountedSet[.iron] // 4
//myCountedSet.remove(.iron) // 3
//myCountedSet.remove(.dwarvish) // 0
//myCountedSet.remove(.magic) // 0
