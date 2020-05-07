import Cocoa

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element)
        }
    }
    
    typealias ArrayLiteralElement = Element
    
    private var storageDict: [Element : Int] = [:]
    var count: Int {
        return storageDict.count
    }
    var isEmpty: Bool {
        return storageDict.isEmpty
    }
    
    mutating func insert(_ element: Element) {
        if storageDict.keys.contains(element) {
            storageDict[element]! += 1
        } else {
            storageDict[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) {
        if storageDict.keys.contains(element), storageDict[element]! > 1 {
            storageDict[element]! -= 1
        } else {
            storageDict[element] = nil
        }
    }
    
    subscript(_ member: Element) -> Int {
        if let num = storageDict[member] {
            return num
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
myCountedSet.remove(.iron)
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)

