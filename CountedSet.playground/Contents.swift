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
    
    mutating func remove(_ element: Element) -> Element? {
        if contains(element) {
            values[element]! -= 1
            if values[element] == 0 {
                values[element] = nil
            }
            return element
        } else {
            return nil
        }
    }
    
    func contains(_ element: Element) -> Bool {
        return values[element] != nil
    }
}

