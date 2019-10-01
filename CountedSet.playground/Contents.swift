import UIKit

let debug: Bool = false

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    private(set) var set: [Element] = []
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: CountedSet.ArrayLiteralElement...) {
        for element in elements {
            set.append(element)
        }
    }

    var isEmpty: Bool {
        return set.count == 0
    }
    
    func count (_ member: Element) -> Int {
        let result = set.filter({$0 == member}).count
        return result
    }
    
    mutating func insert(_ member: Element) -> Int {
        if debug {print ("Set at begining of insert: \(set)")}
        set.append(member)
        if debug {print ("Set at end of insert: \(set)")}
        return count(member)
    }
    
    mutating func remove(_ member: Element) -> Int {
        if debug {print ("Set at begining of remove: \(set)")}
        let index = set.firstIndex(of: member)
        if debug {print ("Remove: Index = \(String(describing: index)) for \(member)")}
        if let index = index {
            if debug {print("Removing index \(index)")}
            set.remove(at: index)
        }
        if debug {print ("Set at end of remove: \(set)")}
        return count(member)
    }
    
    subscript(_ member: Element) -> Int {
        return count(member)
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

var myStringCountedSet: CountedSet<String> = ["Joshua", "Joshua", "Kimberly", "Aidan", "Lily", "Carolyn", "Ba", "Ba"]
myStringCountedSet.insert("Test")
myStringCountedSet.insert("Joshua")
myStringCountedSet.remove("Joshua")
myStringCountedSet["Ba"]

var myNumberCountedSet: CountedSet<Int> = [1,2,3,4,5,6,7,8,9,0,2,3,4,5,6,7,8,9,0,3,4,5,6,7,8,9,0,4,5,6,7,8,9,0,5,6,7,8,9,0,6,7,8,9,0,7,8,9,0]
myNumberCountedSet[9]
myNumberCountedSet.remove(9)
myNumberCountedSet[21]
