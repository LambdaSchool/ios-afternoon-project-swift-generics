import Foundation
import UIKit

struct CountedSet<Element: Hashable> {
    var dictionary = [Element:Int]()
    
    // Adds an element to a counted set and sets the new count of the dictionary + 1 once the element is added. Otherwise it will stay the same.
    // Must be a mutating function because we are in a struct (value-set)
    mutating func insert(_ element: Element) {
        if let elementTotalNumber = dictionary[element] {
            dictionary[element] = elementTotalNumber + 1
        } else {
            dictionary[element] = 1
        }
    }
    
    // Removes an element from a counted set and sets the new count of the dictionary - 1 once the element is removed. Otherwise it will stay the same.
    // Must be a mutating function because we are in a struct (value-set)
    mutating func remove(_ element: Element) {
        guard let elementTotalNumber = dictionary[element] else { return }
        
        if elementTotalNumber > 1 {
            dictionary[element] = elementTotalNumber - 1
        } else {
            dictionary[element] = nil
        }
    }
    
    // The count is the total count of elements in the dictionary.
    var count: Int {
        return dictionary.count
    }
    
    // If the dicitonary is empty isEmpty will be true and the count will equal zero.
    var isEmpty: Bool {
        return count == 0
    }
    
    // Shows how many times the member is in the counted set
    subscript(_ member: Element) -> Int {
        dictionary[member] ?? 0
    }
    
    // Allows to search through the counted set by element. Will return true or false
    func contains(_ element: Element) -> Bool {
        return dictionary.keys.contains(element)
    }
}

// ExpressibleByArrayLiteral - Expresses a list of values, instances, or literals. Can use for a variable, constant, parameter, method, initializer, or even the subject of a nonmutation operation
extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        for elements in arrayLiteral {
            self.insert(elements)
        }
    }
}



enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
print(myCountedSet)
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0

var starWarsTestArray: CountedSet<String> = ["Jedi", "Sith", "Death Watch", "Republic", "Empire", "Trade Confederation"]
starWarsTestArray.isEmpty // returns false
starWarsTestArray.contains("Jedi") // returns true
starWarsTestArray.contains("Luke Skywalker") // returns false
starWarsTestArray.count // 6
starWarsTestArray.remove("Trade Confederation") // removes Trade Confederation
print(starWarsTestArray) // ["Jedi": 1, "Death Watch": 1, "Republic": 1, "Empire": 1, "Sith": 1])
starWarsTestArray.count // 5
starWarsTestArray.insert("Rebellion") // inserts Rebellion at the end of the array
starWarsTestArray.insert("Sith") // adds another count of Sith
print(starWarsTestArray) // ["Jedi": 1, "Rebellion": 1, "Death Watch": 1, "Republic": 1, "Empire": 1, "Sith": 2])
starWarsTestArray.count// 6
