struct CountedSet<Element: Hashable> {
    private (set) var elements: [Element: Int] = [:]
    
    var count: Int {
        return self.elements.count
    }
    
    var isEmpty: Bool {
        return self.elements.count == 0
    }
    
    subscript(_ element: Element) -> Int {
        return self.elements[element] ?? 0
    }
    
    mutating func insert(_ element: Element) {
        self.elements[element, default: 0] += 1
    }
    
    mutating func remove(_ element: Element) -> Int {
        guard let ecount = self.elements[element] else { return 0 }
        
        if ecount == 0 {
            self.elements.removeValue(forKey: element)
        } else {
            self.elements[element] = ecount - 1
        }
        
        return self.elements[element]!
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
