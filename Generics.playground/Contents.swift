import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var dictionary: [Element: Int] = [:]
    
    mutating func insert(_ element: Element) {
        
    }
    
    mutating func remove(_ element: Element) {
        
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
