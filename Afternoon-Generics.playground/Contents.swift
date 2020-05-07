import Foundation

struct CountedSet <T: Hashable>  {
    
    private(set) var dictionary: [T: Int] = [:]
    
    var count: Int {
        dictionary.count
    }
    var isEmpty: Bool {
        return count == 0
    }
    
    //    mutating func insert(_ element: T) -> Int {
    //        if let index = dictionary.index(forKey: element) {
    //            var elementCount = dictionary[index].value
    //            elementCount + 1
    //            dictionary.updateValue(elementCount, forKey: element)
    //            return elementCount
    //        } else {
    //            dictionary.updateValue(1, forKey: element)
    //            return 1
    //        }
    //    }
    
    mutating func insert(_ element: T) {
        if var _ = dictionary[element] {
            dictionary[element]! += 1
        } else {
            dictionary[element] = 1
        }
    }
    
    mutating func remove(_ element: T) -> Int {
        if var _ = dictionary[element] {
            dictionary[element]! -= 1
        } else {
            dictionary[element] = 1
        }
        return dictionary[element] ?? 0
    }
    
    subscript(_ element: T) -> Int {
        return dictionary[element] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    
    init(arrayLiteral element: T...) {
        self.init()
        for element in element {
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
