import UIKit
import Foundation

//Create a generic CountedSet struct that is constrained to Hashable elements
struct CountedSet<Element: Hashable> {
    
    //Use a private dictionary as your backing storage for set members and their counts.
    private var dictionary: [Element: Int] = [:]
    
    //    Add count, returning the number of unique elements in the counted set and isEmpty for when count is zero.
    func count(_ element: Element) -> Int {
        return dictionary[element] ?? 0
    }
    //    Add insertion and removal (insert and remove) of one element at a time.
    mutating func insert(_ element: Element) {
        if count(element) > 0 {
            let addCount = count(element) + 1
            dictionary[element] = addCount
        } else {
            dictionary[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) {
        if count(element) == 1 {
            dictionary.removeValue(forKey: element)
        } else if count(element) > 1 {
            let removeCount = count(element) - 1
            dictionary[element] = removeCount
        }
    }
    
    //    Support subscripting to look up current values (by implementing subscript(_ member: Element) -> Int). Return 0 for any value that is not found.
    subscript(index: Element) -> Int {
        get {
            return dictionary[index]!
        }
        set(count){
            dictionary[index]! = count
        }
    }
}
//As demonstrated in class, conform your set to ExpressibleByArrayLiteral so you can initialize a counted set using an array of same-type items.
extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
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
