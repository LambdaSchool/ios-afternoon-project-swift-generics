/// Create a generic CountedSet struct that is constrained to Hashable elements. A counted set is an unordered collection of unique elements that may appear more than once in the collection. Use a private dictionary as your backing storage for set members and their counts.

struct CountedSet<Element: Hashable> {
    
    private(set) var dict: [Element: Int] = [:]
    
    subscript(_ member: Element) -> Int {
        set {
            print( newValue )
        }
        get {
            if let count = dict[member] {
                return count
            }
            return 0
        }
    }
    
}

//extension CountedSet: ExpressibleByArrayLiteral {
//    init(arrayLiteral: Element...) {
//        self.init()
//        for element in arrayLiteral {
//            self.dict[element] = 1
//        }
//    }
//}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
aCountedSet[.iron] = 5
//var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
//myCountedSet[.iron] // 4
//myCountedSet.remove(.iron) // 3
//myCountedSet.remove(.dwarvish) // 0
//myCountedSet.remove(.magic) // 0
