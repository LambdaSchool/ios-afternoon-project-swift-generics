import UIKit

struct CountedSet<Element: Hashable> {
        
    private var elementCountDictionary = [Element: Int]()
    
    var count: Int {
        return elementCountDictionary.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func insert(_ element: Element) {
        if let elementCount = elementCountDictionary[element] {
            elementCountDictionary[element] = elementCount + 1
        } else {
            elementCountDictionary[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) {
        guard let elementCount = elementCountDictionary[element] else { return }
        
        if elementCount > 1 {
            elementCountDictionary[element] = elementCount - 1
        } else {
            elementCountDictionary[element] = nil
        }
    }
    
    subscript(_ member: Element) -> Int {
        return elementCountDictionary[member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

extension CountedSet {
    func contains(_ element: Element) -> Bool {
        return elementCountDictionary.keys.contains(element)
    }
}

// Interaction style guide from README.md

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron]      // 0

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron]     // 4

myCountedSet.remove(.iron)
myCountedSet[.iron]     // 3

myCountedSet.remove(.dwarvish)
myCountedSet[.dwarvish] // 0

myCountedSet.remove(.magic)
myCountedSet[.magic]    // 0



// MARK: - Testing using Strings as the CountedSet element

// Explicit Type initialization
var countedSetTest1: CountedSet<String> = ["apples", "bananas", "oranges", "mangos", "pinapples"]
countedSetTest1.isEmpty         // false

// Inferred Type initialization
var countedSetTest2: CountedSet = ["apples", "bananas", "oranges", "mangos", "pinapples"]
countedSetTest2.isEmpty         // false

countedSetTest2["apples"]       // 1
countedSetTest2["bananas"]      // 1
countedSetTest2["oranges"]      // 1
countedSetTest2["mangos"]       // 1
countedSetTest2["pinapples"]    // 1
countedSetTest2["dragon fruit"] // 0
countedSetTest2.count           // 5

countedSetTest2.contains("apples")          // true
countedSetTest2.contains("dragon fruit")    // false

// Remove elements
countedSetTest2.remove("apples")
countedSetTest2.remove("pinapples")
countedSetTest2.remove("pinapples")

// Insert elements
countedSetTest2.insert("mangos")
countedSetTest2.insert("dragon fruit")

// Test
countedSetTest2["apples"]       // 0
countedSetTest2["pinapples"]    // 0
countedSetTest2["bananas"]      // 1
countedSetTest2["oranges"]      // 1
countedSetTest2["mangos"]       // 2
countedSetTest2["dragon fruit"] // 1
countedSetTest2.count           // 4

// Remove elements
countedSetTest2.remove("bananas")
countedSetTest2.remove("oranges")
countedSetTest2.remove("mangos")
countedSetTest2.remove("dragon fruit")
// Test
countedSetTest2["bananas"]      // 0
countedSetTest2["oranges"]      // 0
countedSetTest2["mangos"]       // 1
countedSetTest2["dragon fruit"] // 0
countedSetTest2.count           // 1
countedSetTest2.isEmpty         // false

// Remove last element
countedSetTest2.remove("mangos")
countedSetTest2["mangos"]       // 0
countedSetTest2.count           // 0
countedSetTest2.isEmpty         // true



// MARK: - Testing using a custom Type as the CountedSet element
struct MyObject: Hashable {
    var name: String
    var number: Int
    var identifier: UUID
    
    // Non-intuitive implementation of the '==' operator and 'hash(into:)' method.
    // Two MyObjects with the same 'identifier' property will be treated as equivalent
    // even if they have different values stored in their 'name' and/or 'number' properties
    static func == (lhs: MyObject, rhs: MyObject) -> Bool {
        lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

let uuid = UUID()
let object1 = MyObject(name: "Object 1", number: 5, identifier: uuid)
let object2 = MyObject(name: "Object 2", number: 10, identifier: uuid)
let object3 = MyObject(name: "Object 3", number: 5, identifier: UUID())

var countedSetTest3: CountedSet = [object1, object2, object3]
// In the line above, 'countedSetTest3' loops through the assigned array literal
// and recognizes 'object2' as being equivalent to 'object1'. As a result,
// 'countedSetTest3' will simply increment the count of 'object1' by +1

countedSetTest3.contains(object1)   // true
countedSetTest3.contains(object2)   // true
countedSetTest3.contains(object3)   // true
countedSetTest3.count               // 2
countedSetTest3.isEmpty             // false

countedSetTest3[object1]    // 2
countedSetTest3[object2]    // 2
countedSetTest3[object3]    // 1

countedSetTest3.remove(object2)
countedSetTest3[object1]    // 1
countedSetTest3[object2]    // 1
countedSetTest3[object3]    // 1

countedSetTest3.insert(object2)
countedSetTest3[object1]    // 2
countedSetTest3[object2]    // 2
countedSetTest3[object3]    // 1

countedSetTest3.remove(object1)
countedSetTest3.remove(object1)
countedSetTest3[object1]    // 0
countedSetTest3[object2]    // 0
countedSetTest3[object3]    // 1

countedSetTest3.remove(object3)
countedSetTest3.count       // = 0
countedSetTest3.isEmpty     // true
