import UIKit

struct CountedSet<Element: Hashable> {
    
    private(set) var elementsDictionary: [Element: Int] = [:]
    
    // MARK: Count Related Properties
    
    var count: Int {
        return elementsDictionary.count
    }
    
    var isEmpty: Bool {
        if elementsDictionary.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    // MARK: Insert and Remove Methods
    
    mutating func insert(element: Element) {
        elementsDictionary[element] = (elementsDictionary[element] ?? 0) + 1
    }
    
    mutating func remove(element: Element) {
        guard !elementsDictionary.isEmpty else { return }
        (elementsDictionary[element] ?? 0) - 1
    }
    
    // MARK: Subcripting
    
    subscript(_ member: Element) -> Int {
        return elementsDictionary[member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            elementsDictionary[element] = (elementsDictionary[element] ?? 0) + 1
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(element: .iron) // 3
myCountedSet.insert(element: .silver)
myCountedSet[.silver] // 2
myCountedSet.remove(element: .dwarvish) // 0
myCountedSet[.dwarvish]
myCountedSet.insert(element: .dwarvish)
myCountedSet.insert(element: .dwarvish)
myCountedSet[.dwarvish] // 2
myCountedSet.remove(element: .magic) // 0
