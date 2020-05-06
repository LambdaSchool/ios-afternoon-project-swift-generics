import UIKit


struct CountedSet<Element: Hashable> {
    private(set) var dict: [Element: Int] = [:]
    
    subscript(_ key: Element) -> Int {
        set {
            dict[key] = newValue
        }
        get {
            if let count = dict[key] {
                return count
            }
            return 0
        }
    }
    mutating func insert(_ element: Element) {
        if let count = dict[element] {
            dict[element] = count + 1
        } else {
            dict[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) -> Int?  {
        guard let count = dict[element] else { return 0 }
        
        if count > 1 {
            dict[element] = count - 1
        } else {
            dict.removeValue(forKey: element)
        }
        
        return count
    }
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
