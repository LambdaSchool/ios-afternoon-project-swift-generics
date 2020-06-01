import Foundation

struct CountedSet <T: Hashable> {
    private(set) var dictionary: [T: Int] = [:]
    
    var count: Int {
        dictionary.count
    }
    var isEmoty: Bool {
        return count == 0
    }
    
    
    
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
            dictionary[element]
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
aCountedSet[.iron]
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron]
myCountedSet.remove(.iron)
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)
