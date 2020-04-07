import Cocoa

var str = "Hello, playground"

struct CountedSet<Element: Hashable> {
    
    mutating func insert(_ element: Element) {
        if let count = store[element] {
            store[element] = count + 1
        } else {
            store[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) {
        if let count = store[element] {
            if count > 1 {
                store[element] = count - 1
            } else {
                store.removeValue(forKey: element)
            }
        }
    }
    
    subscript(_ element: Element) -> Int {
        if let count = store[element] {
            return count
        } else {
            return 0
        }
    }
    
    var count: Int { store.count }
    var isEmpty: Bool { store.isEmpty }
    
    private var store: [Element: Int]
    
    
}
