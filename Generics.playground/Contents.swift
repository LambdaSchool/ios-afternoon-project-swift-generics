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
    
    // MARK: - Private
    
    private var store: [Element: Int] = [:]
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
