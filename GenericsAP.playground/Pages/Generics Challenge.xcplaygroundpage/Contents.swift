import Foundation

/*
Generics Challenge
 
As demonstrated in class, conform your set to ExpressibleByArrayLiteral so you can initialize a counted set using an array of same-type items.

Your implementation should support the following interaction style: ...

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0

Test

    Run the project and make sure everything works. Create a good suite of tests that check for boundary conditions and many different types.
    If anything doesn't work the way the above example shows, go back and debug your issues.
    As always, if you need help, follow the 20-minute rule, then ask your PM.
*/

// Create a generic CountedSet struct that is constrained to Hashable elements.
// A counted set is an unordered collection of unique elements that may appear more than once in a collection.
struct CountedSet<Element : Hashable> {
    
    // Use a private dictionary as your backing storage for members and their counts
    var dictionary: [Element : Int] = [ : ]
    
    // -Add insertion and removal (insert and remove) of one element at a time.
    mutating func insertion(element: Element) -> Int {
        
        if let index = dictionary.index(forKey: element) {
            var elementCount = dictionary[index].value
            elementCount += 1
            dictionary.updateValue(elementCount, forKey: element)
            return elementCount
        }
        else {
            dictionary.updateValue(1, forKey: element)
            return 1
        }
    }
    
    // -Add insertion and removal (insert and remove) of one element at a time.
    mutating func removal(element: Element) -> Int {
        
        if let index = dictionary.index(forKey: element) {
            var elementCount = dictionary[index].value
            elementCount -= 1
            if elementCount == 0 {
                dictionary.removeValue(forKey: element)
                return elementCount
            } else {
                dictionary.updateValue(elementCount, forKey: element)
                return elementCount
            }
        }
        else {
            return 0
        }
    }
    
    //-Add count, returning the number of unique elements in the counted set and isEmpty for when count is zero.
    var count: Int {
        return dictionary.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    // -Support subscripting to look up current values (by implementing: subscript(_ member: Element) -> Int).
    subscript(_ element: Element) -> Int {
        
        if let index = dictionary.index(forKey: element) {
            return dictionary[index].value
        }
        // Return 0 for any value that is not found
        else {
            return 0
        }
    }
    
    func contains(element: Element) -> Bool {
        return dictionary.keys.contains(element)
    }
}

// Conform to ExpressibleByArrayLiteral
extension CountedSet: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Element...) {
        self.init()
        for element in elements {
            dictionary[element] = (dictionary[element] ?? 0) + 1
        }
    }
}

// Test
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.removal(element: .iron) // 3
myCountedSet.removal(element: .dwarvish) // 0
myCountedSet.removal(element: .magic) // 0

/* Generic Queues/Stacks Example
 struct Queue<Element> {
     private(set) var elements: [Element]
     
     mutating func push(element: Element) {
         elements.append(element)
     }
     
     mutating func pop() -> Element? {
         guard elements.isEmpty == false else { return nil }
         return elements.removeFirst()
     }
     
     func peek() -> Element? {
         return elements.first
     }
 }
 */

