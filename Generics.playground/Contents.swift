import UIKit

//CountedSet Holds a dictionary with ways to modify it
struct CountedSet <Element: Hashable> {
    
    //Key - Member, Value - Members Count
    private(set) var dictionary = [Element: Int]()
    var count: Int? {
        if dictionary.isEmpty {
            return 0
        } else {
            return dictionary.count
        }
    }
    
    //Inserting into dictionary
    mutating func insert(element: Element) {
        //dictionary[key] = value
        dictionary[element] = (dictionary[element] ?? 0) + 1
    }
    
    //Removing From dictionary
    mutating func remove(element: Element) {
        dictionary[element] = nil
    }
    
    //Allows us to call countedSet directly
    //Then Execute Subscript
    subscript(_ member: Element) -> Int {
        if let result = dictionary[member] {
            return result
        } else {
            return 0
        }
    }
}


//MARK: - Properties
var countedSet = CountedSet(dictionary: ["Cameron" : 1, "Sadie": 2, "Bill" : 3])
countedSet.dictionary


//MARK: - Method Calls
//countedSet.remove(element: "Bill")
countedSet.insert(element: "Orion")
countedSet.count

//Subscript Call
countedSet["Cam"]
countedSet["Orion"]



//MARK: - Conformance to ExpressibleByArrayLiteral
extension CountedSet: ExpressibleByArrayLiteral {
    
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            dictionary[element] = (dictionary[element] ?? 0) + 1
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
myCountedSet.count


