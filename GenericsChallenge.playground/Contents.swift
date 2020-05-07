import Foundation

//Create a generic CountedSet struct that is constrained to Hashable elements. A counted set is an unordered collection of unique elements that may appear more than once in the collection. Use a private dictionary as your backing storage for set members and their counts.

// Add insertion and removal (insert and remove) of one element at a time.
// Support subscripting to look up current values (by implementing subscript(_ member: Element) -> Int). Return 0 for any value that is not found.
// Add count, returning the number of unique elements in the counted set and isEmpty for when count is zero.

//Conform your set to ExpressibleByArrayLiteral so you can initialize a counted set using an array of same-type items. You can explore Apple's documentation for the protocol to see what its implementation requires.

struct CountedSet<Element: Hashable> {
    private var storageDictionary = [Element: Int]()
    var count = 0
    
    
    mutating func insert(_ element: Element) {
        if storageDictionary.keys.contains(element) {
            storageDictionary[element]! += 1
        } else {
            storageDictionary[element] = 1
        }
    }

    
    mutating func remove(_ element: Element) {
        if storageDictionary.keys.contains(element) {
            count = storageDictionary[element] ?? 0
            if count > 0 {
                storageDictionary[element] = count - 1
            }
        } else {
            storageDictionary[element] = 0
        }
    }
    
    subscript(_ member: Element) -> Int {
        return storageDictionary[member] ?? 0
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

// MARK: Tests
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
