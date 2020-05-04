import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var storage = [Element: Int]()
}

extension CountedSet {
    
    mutating func insert(element: Element) {
        storage[element] = (storage[element] ?? 0) + 1
    }
    
    
}
