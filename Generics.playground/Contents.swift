import Foundation

struct CountedSet<Element: Hashable> {
    private var dictionary: [Element: Int] = [:]
    var count: Int {
        return dictionary.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func insert(_ item: Element) {
        if dictionary.keys.contains(item) {
            if let number = dictionary[item] {
                dictionary[item] = number + 1
            }
        } else {
            dictionary[item] = 1
        }
    }
    
    mutating func remove(_ item: Element) {
        
        if let quantity = dictionary[item],
            quantity > 1 {
            dictionary[item] = quantity - 1
        } else {
            dictionary.removeValue(forKey: item)
        }
    }
    
    func contains(_ item: Element) -> Bool {
        return dictionary.keys.contains(item)
    }
    
    subscript(_ member: Element) -> Int {
        if let quantity = dictionary[member] {
            return quantity
        } else {
            return 0
        }
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            self.insert(element)
        }
    }
}

var testSet = CountedSet<Double>()

testSet.insert(2.1)
testSet.insert(2.1)
testSet.insert(4)
print("1. \(testSet[2.1])")
print(testSet)
testSet.remove(2.1)
print("2. \(testSet)")
testSet.count
testSet.isEmpty
testSet.insert(5.3)

for _ in 0...109 {
    testSet.insert(4.8)
}

testSet[4.8]

for _ in 0...100 {
    testSet.remove(4)
}

testSet
var testSet2: CountedSet = ["wow", "goodStuff", "mhm"]

testSet2.insert("yep")
testSet2["yep"]

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var aCountedSet = CountedSet<Arrow>()

aCountedSet[.iron]
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

myCountedSet[.iron]
myCountedSet.remove(.iron)
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)
print("3 \(myCountedSet.contains(.dwarvish))")
