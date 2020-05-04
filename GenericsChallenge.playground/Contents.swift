import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var storage = [Element: Int]()
}

extension CountedSet {
    
    mutating func insert(element: Element) {
        storage[element] = (storage[element] ?? 0) + 1
    }
    
    mutating func remove(element: Element) {
        let count = (storage[element] ?? 0)
        if count > 0 {
            storage[element] = count - 1
        }
    }
    
    subscript(member: Element) -> Int {
        return storage[member] ?? 0
    }
    
    
}
