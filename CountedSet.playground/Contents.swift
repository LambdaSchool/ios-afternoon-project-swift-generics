import Foundation

struct CountedSet<Element: Hashable> {
    private var values = [Element: Int]()
    
    mutating func insert(_ newElement: Element) {
        if contains(newElement) {
            values[newElement]! += 1
        } else {
            values[newElement] = 1
        }
    }
    
    mutating func remove(_ element: Element) -> Int {
        if contains(element) {
            values[element]! -= 1
            if values[element] == 0 {
                values[element] = nil
            }
        }
        return values[element] ?? 0
    }
    
    func contains(_ element: Element) -> Bool {
        return values[element] != nil
    }
    
    
}

