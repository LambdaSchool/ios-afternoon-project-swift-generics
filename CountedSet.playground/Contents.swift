import Cocoa

struct CountedSet<Element: Hashable> {

    var count: Int { elementCounts.count }
    var isEmpty: Bool { elementCounts.count == 0 }
    
    subscript(_ member: Element) -> Int {
        elementCounts[member] ?? 0
    }
    
    private var elementCounts: [Element: Int] = [:]
    
    mutating func insert(_ element: Element) -> Int {
        if let count = elementCounts[element] {
            elementCounts[element] = count + 1
        } else {
            elementCounts[element] = 1
        }
        return elementCounts[element] ?? 0
    }
    
    mutating func remove(_ element: Element) -> Int {
        if let count = elementCounts[element] {
            if count > 1 {
                elementCounts[element] = count - 1
            } else {
                elementCounts.removeValue(forKey: element)
            }
        }
        return elementCounts[element] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element)
        }
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

myCountedSet.remove(.magic)
myCountedSet.remove(.magic)

myCountedSet.insert(.iron)
myCountedSet.insert(.iron)
myCountedSet.insert(.iron)

aCountedSet.count
myCountedSet.count

aCountedSet.isEmpty
myCountedSet.isEmpty

var intCountedSet: CountedSet<Int> = [1, 2, 3, 10]
intCountedSet.count
intCountedSet.isEmpty
intCountedSet[1]
intCountedSet.insert(1)
intCountedSet.insert(1)
intCountedSet.insert(1)
intCountedSet[1]

var stringCountedSet: CountedSet<String> = ["a", "foo", "swift"]
stringCountedSet.count
stringCountedSet.insert("swift")
stringCountedSet.insert("b")
stringCountedSet.count
stringCountedSet["swift"]
