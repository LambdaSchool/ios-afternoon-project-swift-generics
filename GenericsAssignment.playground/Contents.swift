import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var dictionary: [Element: Int] = [:]


    // MARK: - Methods

    // Insert a new element into a dictionary
    mutating func insert(element: Element) {
        dictionary[element] = (dictionary[element] ?? 0) + 1
    }

    // Remove an element from dictionary
    mutating func remove(element: Element) {
        dictionary[element] = nil
    }
}
