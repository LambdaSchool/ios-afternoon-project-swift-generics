import UIKit

struct CountedSet<Element: Hashable> {
    
    
    private(set) var array: [Element]
    
    mutating func insert(element: Element) {
        array.append(element)
    }
    
    mutating func remove(element: Element) {
        array.remove(at: element as! Int)
    }
    
    func count(element: Element) -> Int {
        return array.count
    }
    
    subscript(_ member: Element) -> Int {
        
    }
    
}
