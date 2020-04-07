import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var elements: [Element: Int] = [:]
    
    mutating func insert(element: Element) {
        elements[element] = (elements[element] ?? 0) + 1
    }
    
    mutating func remove(element: Element) {
        guard !elements.isEmpty else { return }
        (elements[element] ?? 0) - 1
    }
}
