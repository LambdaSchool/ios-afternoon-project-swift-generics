import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var elements: [Element: Int] = [:]
    
    // MARK: Count Related Properties
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        if elements.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    // MARK: Insert and Remove Methods
    
    mutating func insert(element: Element) {
        elements[element] = (elements[element] ?? 0) + 1
    }
    
    mutating func remove(element: Element) {
        guard !elements.isEmpty else { return }
        (elements[element] ?? 0) - 1
    }
    
    // MARK: Subcripting
    
    subscript(_ member: Element) -> Int {
        return elements[member] ?? 0
    }
}
