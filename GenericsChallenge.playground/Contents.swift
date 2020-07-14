import Foundation

struct CountedSet<T: Hashable>: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = T
    
    private var dict = [T:Int]()
    
    init(arrayLiteral elements: ArrayLiteralElement...) {
        for element in elements {
            self.insert(element)
        }
    }
    
    mutating func insert(_ element: T) {
        dict[element] = (dict[element] ?? 0) + 1
    }
    
    mutating func remove(_ element: T) -> Int {
        guard let value = dict[element] else { return 0 }
        
        if value >= 1 {
            dict[element] = value - 1
        }
        
        return dict[element] ?? 0
    }
    
    subscript(_ member: T) -> Int {
        return dict[member] ?? 0
    }
    
    var count: Int {
        return dict.count
    }
    
    var isEmpty: Bool {
        return dict.count == 0
    }
    
    func contains(_ element: T) -> Bool {
        guard let value = dict[element] else { return false }
        
        if value >= 1 {
            return true
        }
        
        return false
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.count // 3
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
myCountedSet.contains(.iron) // true
myCountedSet.contains(.magic) // false
