import Foundation


struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
    private(set) var elements = [Element: Int]()
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            self.elements[element] = (self.elements[element] ?? 0) + 1
        }
    }
    
    mutating func insert(element: Element) {
       elements[element] = (elements[element] ?? 0) + 1
    }
    
    mutating func remove(element: Element) {
        let count = elements[element] ?? 0
        if count > 0 {
            elements[element] = count - 1
        }
    }
    
    subscript(_ member: Element) -> Int {
        return elements[member] ?? 0
    }
    
    mutating func contains(element: Element) -> Bool {
        let count = elements[element] ?? 0
        if count != 0 {
            return true
        } else {
            return false
        }
    }
    
    func isDisjoint(element: Element) -> Bool {
        let count = elements[element] ?? 0
        if count <= 1 {
            return false
        } else {
            return true
        }
    }

    
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
print(aCountedSet)
aCountedSet[.iron]
print(aCountedSet)
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron]
myCountedSet.contains(element: .iron)
myCountedSet.isDisjoint(element: .iron)
myCountedSet.isDisjoint(element: .magic)
myCountedSet.contains(element: .dwarvish)
print(myCountedSet[.iron])
myCountedSet.remove(element: .iron)
print(myCountedSet[.iron])
myCountedSet.remove(element: .dwarvish)





