/// Create a generic CountedSet struct that is constrained to Hashable elements. A counted set is an unordered collection of unique elements that may appear more than once in the collection. Use a private dictionary as your backing storage for set members and their counts.

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
    
    var count: Int {
        dict.count
    }

    var isEmpty: Bool {
        return dict.count > 0 ? false : true
    }
    
    func insert(_ key: Element) {
        
    }

    mutating func remove(_ key: Element) -> Int {
        guard var item = dict[key] else { return 0 }
        
        item -= 1
        
        if item == 0 {
            dict[key] = nil
        }
        
        return item
    }
    
    func contains(_ key: Element) -> Bool {
        guard let _ = dict[key] else { return false }
        return true
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
assert(aCountedSet.isEmpty == true, "aCountedSet should have been empty")
assert(aCountedSet[.iron] == 0, ".iron should not exist")
aCountedSet[.iron] = 5
assert(aCountedSet[.iron] == 5, "Result should have been 5")

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
assert(myCountedSet.count == 3, "Expected 3 items in set")
assert(myCountedSet[.iron] == 4, ".iron count should be 4")
assert(myCountedSet.remove(.iron) == 3, ".iron count should be 3")
assert(myCountedSet.remove(.dwarvish) == 0, ".dwarvish shouldn't exist")
assert(myCountedSet.contains(.magic) == true, ".magic should be in the set")
assert(myCountedSet.remove(.magic) == 0, "Should have been the last .magic")
assert(myCountedSet.contains(.magic) == false, ".magic shouldn't be in the set")
/// Reducing magic to zero means magic is removed and count is reduced by 1
assert(myCountedSet.count == 2, "count should be 2")
