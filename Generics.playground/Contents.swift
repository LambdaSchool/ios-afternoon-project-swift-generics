import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var dictionary: [Element: Int] = [:]
    
    var count: Int? {
        if dictionary.isEmpty {
            return 0
        } else {
            return dictionary.count
        }
    }
    
    // Insert a new element into dictionary
    mutating func insert(_ element: Element) {
        
    }
    
    // Remove an element from dictionary 
    mutating func remove(_ element: Element) {
        
    }
    
    subscript(_ member: Element) -> Int {
        if let result = dictionary[member] {
            return result
        } else {
            return 0
        }
        
    }
}


extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.init()
        for element in elements {
            self.dictionary[element]
        }
    }
}
