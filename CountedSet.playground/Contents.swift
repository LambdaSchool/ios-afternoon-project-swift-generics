import Foundation

struct CountedSet<Element: Hashable> {
    private var values = [Element: Int]()
    
    subscript(_ member: Element) -> Int {
        get {
            return values[member] ?? 0
        }
    }
    
    var count: Int {
        return values.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func insert(_ newElement: Element) {
        values[newElement] = (values[newElement] ?? 0) + 1
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

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        elements.forEach { element in
            insert(element)
        }
    }
    
    typealias ArrayLiteralElement = Element
}

