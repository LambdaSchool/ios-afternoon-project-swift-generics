import Cocoa

var str = "Hello, playground"

struct CountedSet<Element: Hashable> {
    mutating func insert(_ element: Element) {
        if let count = store[element] {
            store[element] = count + 1
        } else {
            store[element] = 1
        }
    }
    
    mutating func increment(_ element: Element, by amount: Int) {
        if let count = store[element] {
            store[element] = count + amount
        } else {
            store[element] = amount
        }
    }
    
    mutating func remove(_ element: Element) {
        if let count = store[element] {
            if count > 1 {
                store[element] = count - 1
            } else {
                store.removeValue(forKey: element)
            }
        }
    }
    
    subscript(_ element: Element) -> Int {
        if let count = store[element] {
            return count
        } else {
            return 0
        }
    }
    
    mutating func union(with countedSet: CountedSet) {
        for element in countedSet {
            self.increment(element, by: countedSet[element])
        }
    }
    
    func unioned(with countedSet: CountedSet) -> CountedSet<Element> {
        var result = self
        for element in countedSet {
            result.increment(element, by: countedSet[element])
        }
        return result
    }
    
    var count: Int { store.count }
    var isEmpty: Bool { store.isEmpty }
    
    // MARK: - Private
    
    private var store: [Element: Int] = [:]
}

// MARK: - Array Literal Protocol

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

// MARK: - Sequence Protocol

extension CountedSet: Sequence {
    __consuming func makeIterator() -> Iterator {
        let iterator = Iterator(elements: Array(store.keys))
        return iterator
    }
    
    struct Iterator: IteratorProtocol {
        var index = 0
        let elements: [Element]
        mutating func next() -> Element? {
            guard index < elements.count else { return nil }
            defer { index += 1 }
            return elements[index]
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

myCountedSet.contains(.iron)

var countedNums: CountedSet<Int> = [1, 1, 2, 3]
var otherNums: CountedSet<Int> = [3, 3, 4, 5]

countedNums.union(with: otherNums)
let someNums = countedNums.unioned(with: otherNums)
