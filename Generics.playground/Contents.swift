import UIKit

struct CountedSet <Element: Hashable> {
    
    private(set) var dictionary = [Element: Int]()
    
    var count: Int? {
        if dictionary.isEmpty {
            return nil
        } else {
            return dictionary.count
        }
    }
    
    mutating func insert(element: Element) {
        dictionary[element] = (dictionary[element] ?? 0) + 1
    }
    
    mutating func remove(element: Element) {
        let count = (dictionary[element] ?? 0)
        if count > 0 {
            dictionary[element] = count - 1
        }
    }
    
    subscript(_ member: Element) -> Int {
        dictionary[member] ?? 0
    }
}

var countedSet = CountedSet(dictionary: ["Squidward" : 1, "Spongebob": 2, "Sandy" : 3])


//MARK: - ExpressibleByArrayLiteral
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
