import UIKit

struct CountedSet<Element: Hashable> {
    
    private (set) var elements: [Element: Int] = [:]
    
    mutating func insert(_ element: Element) {
        
    }
    
    mutating func remove(_ element: Element) {
        
    }
    
    subscript(_ member: Element) -> Int {
        //Return `0` for any value that is not found.
    }
    
}

extension CountedSet where Element: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element

    
    
}
