import UIKit

struct CountedSet<Element: Hashable>: Equatable {
    private var countedDictionary: [Element: Int] = [:]
    
    mutating func insert(_ element: Element) {
        if let occurences = countedDictionary[element] {
            countedDictionary[element] = occurences + 1
        } else {
            countedDictionary.updateValue(1, forKey: element)
        }
    }
    
    mutating func remove(_ element: Element) {
        if let occurences = countedDictionary[element] {
            if occurences != 0 {
                countedDictionary[element] = occurences - 1
            } else {
                countedDictionary.removeValue(forKey: element)
            }
        }
    }
    
    subscript(element: Element) -> Int? {
        return countedDictionary[element] ?? 0
    }
    
    func count() -> Int {
        var total: Int = 0
        for (_, occurences) in countedDictionary {
            total += occurences
        }
        return total
    }
    
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            insert(element)
        }
    }
}
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var arrowStock = CountedSet<Arrow>()
arrowStock[.iron]
print(arrowStock[.iron])

var myQuiver: CountedSet<Arrow> = [.iron, .dwarvish, .magic, .iron, .elven, .silver, .silver, .iron]
myQuiver.insert(.magic)
myQuiver.insert(.elven)
myQuiver.remove(.iron)
print(myQuiver.count())
myQuiver.insert(.silver)
myQuiver.insert(.dwarvish)
myQuiver.remove(.iron)






