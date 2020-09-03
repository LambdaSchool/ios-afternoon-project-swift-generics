import UIKit

struct CountedSet<Element: Hashable> {
private(set) var elements: [Element: Int] = [:]

subscript(_ key: Element) -> Int {
    set {
        elements[key] = newValue
    }
    get {
        if let count = elements[key] {
            return count
        }
        return 0
    }
}
    
    
    
}
