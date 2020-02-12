/*:
 ## Create a generic CountedSet struct that is constrained to Hashable elements. A counted set is an unordered collection of unique elements that may appear more than once in the collection. Use a private dictionary as your backing storage for set members and their counts.
 */
struct CountedSet<Element: Hashable> {
    private(set) var storage = [Element:Int]()
}
/*: Generics
 # Goals:
 
 * Add insertion and removal (insert and remove) of one element at a time.
 * Support subscripting to look up current values (by implementing subscript(_ member: Element) -> Int). Return 0 for any value that is not found.
 * Add count, returning the number of unique elements in the counted set and isEmpty for when count is zero.
 */
//=======================
// MARK: - Insert and remove one element at a time
extension CountedSet {
    mutating func insert(element: Element) {
        storage[element] = (storage[element] ?? 0) + 1
    }
    
    mutating func remove(_ element: Element) {
        let count = (storage[element] ?? 0)
        if count > 0 {
            storage[element] = count - 1
        }
    }
}

//=======================
// MARK: - Support Subscripting
extension CountedSet {
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
}

//=======================
// MARK: - Add Count
extension CountedSet {
    var count: Int? {
        if storage.count == 0 {
            return nil
        }
        return storage.count
    }
}
/*:
 
 # Conform to ExpressiblebyArrayLiteral
 ### Your implementation should support the following interaction style:
 
 ``` enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
 var aCountedSet = CountedSet<Arrow>()
 aCountedSet[.iron] // 0
 var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
 myCountedSet[.iron] // 4
 myCountedSet.remove(.iron) // 3
 myCountedSet.remove(.dwarvish) // 0
 myCountedSet.remove(.magic) // 0
 */
extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    init(arrayLiteral elements: Element...) {
        for element in elements {
            storage[element] = (storage[element] ?? 0) + 1
        }
    }
}

enum Arrow {
    case iron
    case magic
    case silver
    case dwarvish
}

let aCountedSet = CountedSet<Arrow>()
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

myCountedSet[.iron]
myCountedSet.remove(.iron)
myCountedSet[.iron]

myCountedSet[.magic]
myCountedSet.remove(.magic)
myCountedSet[.magic]

myCountedSet[.silver]
myCountedSet.remove(.silver)
myCountedSet[.silver]
