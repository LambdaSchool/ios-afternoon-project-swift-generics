import Foundation



struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {

    init(arrayLiteral elements: Element...) {
        for element in elements {
            self.insert(element)
        }
    }

    private var countDictionary: [Element: Int] = [:]

    mutating func insert(_ element: Element) {
        if let occurances = countDictionary[element] {
            countDictionary[element] = occurances + 1
        } else {
            countDictionary.updateValue(1, forKey: element)
        }
    }

    mutating func remove(_ element: Element) {
        if let occurances = countDictionary[element] {
            if occurances != 0 {
                countDictionary[element] = occurances - 1
            } else {
                countDictionary.removeValue(forKey: element)
            }
        }
    }


    subscript(element: Element) -> Int? {
        return countDictionary[element] ?? 0
    }
    
    
    func count() -> Int {
        var total: Int = 0
        for (_, occurances) in countDictionary {
            total += occurances
        }
        return total
    }
    
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
print(aCountedSet[.iron])


var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
print(myCountedSet)
print(myCountedSet.count())


myCountedSet.remove(.iron) // 3
print(myCountedSet)
print(myCountedSet.count())


myCountedSet.remove(.dwarvish) // 0
print(myCountedSet)
print(myCountedSet.count())


myCountedSet.remove(.magic) // 0
print(myCountedSet)
print(myCountedSet.count())


