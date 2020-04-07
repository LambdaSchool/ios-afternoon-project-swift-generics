import Cocoa




struct CountedSet<Element:Hashable>: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        for element in elements {
            let elementCount = count(element)
            if elementCount == 0 {
                storage[element] = 1
            } else {
                storage[element] = elementCount + 1
            }
        }
    }
    typealias ArrayLiteralElement = Element
    
    private(set) var storage: [Element : Int] = [:]
    
    mutating func insert(_ member: Element) {
        let elementCount = count(member)
        if elementCount == 0 {
            storage[member] = 1
        } else {
            storage[member] = elementCount + 1
        }
    }
    
    mutating func remove(_ member: Element) -> Int {
        let elementCount = count(member)
        if elementCount == 0 {
            storage[member] = nil
        } else {
            storage[member] = elementCount - 1
        }
        return elementCount - 1
    }
    
    func count(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
        
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
}
    

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
//myCountedSet.remove(.dwarvish) // 0
//myCountedSet.remove(.magic) // 0
