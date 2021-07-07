import Foundation

struct CountedSet<Element : Hashable> {
   
    private var dictionary: [Element : Int] = [ : ]
    
    var count: Int {
        return dictionary.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func remove(element: Element) -> Int {
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
        } else {
            return 0
        }
    }
    
    mutating func insert(element: Element) -> Int {
        if let index = dictionary.index(forKey: element) {
            var elementCount = dictionary[index].value
            elementCount += 1
            dictionary.updateValue(elementCount, forKey: element)
            return elementCount
        } else {
            dictionary.updateValue(1, forKey: element)
            return 1
        }
    }
    
    func contains(element: Element) -> Bool {
        return dictionary.keys.contains(element)
    }
    
    subscript(_ element: Element) -> Int {
        if let index = dictionary.index(forKey: element) {
            return dictionary[index].value
        } else {
            return 0
        }
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Element...) {
        self.init()
        for element in elements {
            dictionary[element] = (dictionary[element] ?? 0) + 1
        }
    }
}

var myTestSet = CountedSet<String>()
myTestSet.insert(element: "Testing")
print(myTestSet.isEmpty)
myTestSet.insert(element: "Ok I think its working")
myTestSet.insert(element: "Sweet")
print(myTestSet.count)
myTestSet.insert(element: "Yeet")
print(myTestSet.contains(element: "Yeet"))
myTestSet.remove(element: "Testing")
myTestSet.insert(element: "Woot")
myTestSet.insert(element: "Woot")
myTestSet.insert(element: "Yeet")
myTestSet.insert(element: "Yeet")
myTestSet.insert(element: "Yeet")
print(myTestSet.contains(element: "Yeet"))
print(myTestSet.count)
print(myTestSet)

var myTestSet2 = CountedSet<Double>()
myTestSet2.insert(element: 7.77)
myTestSet2.insert(element: 2.5)
myTestSet2.insert(element: 12.0)
myTestSet2.insert(element: 7.77)
myTestSet2.remove(element: 2.5)
myTestSet2[7.77]
print(myTestSet2.count)
print(myTestSet2)

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet
myCountedSet[.iron] // 4
myCountedSet.remove(element: .iron) // 3
myCountedSet.remove(element: .dwarvish) // 0
myCountedSet.remove(element: .magic) // 0
print(myCountedSet.count)



