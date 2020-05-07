import UIKit

struct CountedSet<Element: Hashable> {
    
    private var dictionary: [Element: Int] = [:]
    
    mutating func insert(_ element: Element) -> Int {
        print(dictionary)
        if let index = dictionary.index(forKey: element) {
            var elementCount = dictionary[index].value
            elementCount += 1
            dictionary.updateValue(elementCount, forKey: element)
            return elementCount
        } else {
            dictionary.updateValue(1, forKey: element)
            return 1
        }
        print(dictionary)
    }
    
    mutating func remove(element: Element) -> Int {
        print(dictionary)
        if let index = dictionary.index(forKey: element) {
            var elementCount = dictionary[index].value
            elementCount -= 1
            if isEmpty {
                dictionary.removeValue(forKey: element)
                return elementCount
            } else {
                dictionary.updateValue(elementCount, forKey: element)
                return elementCount
            }
        } else {
            return 0
        }
        print(dictionary)
    }
    
    subscript(_ element: Element) -> Int {
        print(dictionary)
        if let index = dictionary.index(forKey: element) {
            return dictionary[index].value
        } else {
            return 0
        }
        print(dictionary)
    }
    
    var count: Int {
        return dictionary.count
    }
    
    var isEmpty: Bool {
        return count == 0
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


var countedSetTest = CountedSet<String>()
countedSetTest.insert("This")
countedSetTest.insert("Another one")
countedSetTest.insert("This")
countedSetTest.insert("This")
