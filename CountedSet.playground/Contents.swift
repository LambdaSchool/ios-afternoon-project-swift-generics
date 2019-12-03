import Foundation

struct CountedSet<Element: Hashable> {
    private var values = [Element: UInt]()
    
    mutating func insert(_ newElement: Element) {
        if values[newElement] != nil {
            values[newElement]! += 1
        } else {
            values[newElement] = 1
        }
    }
    
}

