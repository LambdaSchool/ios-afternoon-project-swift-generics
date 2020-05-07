import Foundation

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral{
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element)
        }
    }
    
    typealias ArrayLiteralElement = Element
    
    private var storage: [Element : Int] = [:]
    
    var count: Int {
        return storage.count
    }
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    mutating func insert(_ element: Element){
        if storage.keys.contains(element){
            storage[element]! += 1
        } else {
            storage[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) {
        if storage.keys.contains(element), storage[element]! > 1 {
            storage[element]! -= 1
        } else {
            storage[element] = nil
        }
    }
    
    subscript(_ member: Element) -> Int {
        if let value = storage[member] {
            return value
        } else {
            return 0
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet[.iron]
myCountedSet.remove(.dwarvish) // 0
myCountedSet[.dwarvish]
myCountedSet.remove(.magic) // 0
myCountedSet[.magic]

