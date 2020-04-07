import Cocoa




struct CountedSet<Element:Hashable>: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        for element in elements {
            let elementCount = countValues(element)
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
        let elementCount = countValues(member)
        if elementCount == 0 {
            storage[member] = 1
        } else {
            storage[member] = elementCount + 1
        }
    }
    
    mutating func remove(_ member: Element) -> Int {
        let elementCount = countValues(member)
        if elementCount == 1 {
            storage[member] = nil
        } else if elementCount == 0 {
            return 0
        } else {
            storage[member] = elementCount - 1
        }
        return elementCount - 1
    }
    
    func countValues(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
    
    var count: Int {
        return storage.count
    }
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    func contains(_ member: Element) -> Bool {
        if countValues(member) == 0 {
            return false
        } else {
            return true
        }
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
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
myCountedSet.isEmpty
myCountedSet.count

var cs = CountedSet<String>()
cs = ["Hello", "World"]
cs["Hello"]
cs.count
cs.isEmpty
cs.insert("Hello")
cs.count
cs["Hello"]
cs.remove("World")
cs.count
cs.contains("World")
