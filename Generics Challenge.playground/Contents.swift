/// Create a generic CountedSet struct that is constrained to Hashable elements. A counted set is an unordered collection of unique elements that may appear more than once in the collection. Use a private dictionary as your backing storage for set members and their counts.

struct CountedSet<Element: Hashable> {
    
    /* private(set) */ var dict: [Element: Int] = [:] // FIXME:
    
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
    
    var count: Int {
        dict.count
    }

    var isEmpty: Bool {
        return dict.count > 0 ? false : true
    }
    
    func insert(_ key: Element) {
        
    }

    func remove(_ key: Element) {
        
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.dict[element] = (self.dict[element] ?? 0) + 1
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
assert(aCountedSet.isEmpty == true, "aCountedSet should have been true")
assert(aCountedSet[.iron] == 0, "Result should have been 0")
aCountedSet[.iron] = 5
assert(aCountedSet[.iron] == 5, "Result should have been 5")
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet.count
assert(myCountedSet[.iron] == 4, ".iron count should be 4")
assert(myCountedSet.remove(.iron) // 3
//myCountedSet.remove(.dwarvish) // 0
//myCountedSet.remove(.magic) // 0
