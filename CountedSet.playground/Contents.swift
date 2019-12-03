import Foundation

struct CountedSet<Element: Hashable> {
    private var values = [Element: UInt]()
    
    mutating func insert(_ newElement: Element) {
        if contains(newElement) {
            values[newElement]! += 1
        } else {
            values[newElement] = 1
        }
    }
    
    func contains(_ element: Element) -> Bool {
        return values[element] != nil
    }
}

