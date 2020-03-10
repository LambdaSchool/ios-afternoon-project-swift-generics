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
