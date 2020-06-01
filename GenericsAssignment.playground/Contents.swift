import UIKit

struct CountedSet<Element: Hashable> {

    // MARK: - Properties

    private(set) var dictionary: [Element: Int] = [:]

    var count: Int? {
        if dictionary.isEmpty {
            return 0
        } else {
            return dictionary.count
        }
    }
    
    // MARK: - Methods

    // Insert a new element into a dictionary
    mutating func insert(element: Element) {
        dictionary[element] = (dictionary[element] ?? 0) + 1
    }

    // Remove an element from dictionary
    mutating func remove(element: Element) {
        dictionary[element] = nil
    }

    // Calls CountedSet elements so you are able to access whichever element within an array using subscript syntax
    // grabbing a value from the dictionary and returning it.
    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0

    }
}
