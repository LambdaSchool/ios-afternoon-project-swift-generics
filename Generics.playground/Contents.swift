import UIKit

struct CountedSet<Element: Hashable> {
    
    // MARK: - Properties
    
    private(set) var dictionary: [Element: Int] = [:]
    
    var count: Int? {
        if dictionary.isEmpty {
            return 0
        } else {
            return dictionary.count
        }
    }
    
    // MARK: - Methods
    
    // Insert a new element into dictionary
    mutating func insert(element: Element) {
        dictionary[element] = (dictionary[element] ?? 0) + 1
    }
    
    // Remove an element from dictionary
    mutating func remove(element: Element) {
        dictionary[element] = nil
    }
    
    // Calls CountedSet elements so you are able to access whichever element within an array using subscript syntax
    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0 
        
    }
}

// MARK: - Creating Property by calling CountedSet
var countedSet = CountedSet(dictionary: ["Harmony" : 1, "Carl" : 2, "Boo" : 3])
countedSet.dictionary

// MARK: - Calling Methods

countedSet.remove(element: "Boo")
countedSet.insert(element: "Shelley")
countedSet.count

// MARK: - Subscript Calls
countedSet["Harmony"]
countedSet["Shelley"]

// MARK: - Extension
extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.init()
        for element in elements {
            self.dictionary[element]
        }
    }
}


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.dictionary
myCountedSet.remove(element: .iron) // 3
myCountedSet.remove(element: .dwarvish) // 0
myCountedSet.remove(element: .magic) // 0

