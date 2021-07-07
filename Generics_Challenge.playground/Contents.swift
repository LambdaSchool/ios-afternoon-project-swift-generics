import Foundation

 struct CountedSet<Element: Hashable> {

     private var dict: [Element: Int] = [:]
    var count: Int {
        return dict.count
    }
    var isEmpty: Bool {
        return count == 0
    }

     mutating func insert(_ item: Element) {
        if dict.keys.contains(item) {
            if let number = dict[item] {
                dict[item] = number + 1
            }
        } else {
            dict[item] = 1
        }
    }

     mutating func remove(_ item: Element) {

         if let quantity = dict[item],
            quantity > 1 {
            dict[item] = quantity - 1
        } else {
            dict.removeValue(forKey: item)
        }
    }

     func contains(_ item: Element) -> Bool {
        return dict.keys.contains(item)
    }

     subscript(_ member: Element) -> Int {
        if let quantity = dict[member] {
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
print(testSet[2.1])
print(testSet)
testSet.remove(2.1)
print(testSet)
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
var otherTestSet: CountedSet = ["hi", "hello", "howdy", "hi", "hi"]
otherTestSet.insert("hi")
otherTestSet["hi"]

 enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
print(myCountedSet.contains(.dwarvish))


