import UIKit

struct CountedSet<Element: Hashable> {
    
    private var dictionary = [Element: Int] ()
    var count: Int {
        return dictionary.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func insert(element: Element) {
        if let elementCount = dictionary[element] {
            dictionary[element] = elementCount + 1
        } else {
            dictionary[element] = 1
        }
    }
    
    mutating func remove(element: Element) {
        guard let elementCount = dictionary[element] else { return }
        if elementCount > 1 {
            dictionary[element] = elementCount - 1
        } else {
            dictionary[element] = nil
        }
    }
    
    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element: element)
        }
    }
}


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(element: .iron) // 3
myCountedSet.remove(element: .dwarvish) // 0
myCountedSet.remove(element: .magic) // 0



