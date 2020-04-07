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
    
    mutating func remove(_ element: Element) {
        if let count = store[element] {
            if count > 1 {
                store[element] = count - 1
            } else {
                store.removeValue(forKey: element)
            }
        }
    }
    
    mutating func increment(_ element: Element, by amount: Int) {
        if let count = store[element] {
            store[element] = count + amount
        } else {
            store[element] = amount
        }
    }
    
    mutating func decrement(_ element: Element, by amount: Int) {
        if let count = store[element], count > amount {
            store[element] = count - amount
        } else {
            store.removeValue(forKey: element)
        }
    }
    
    subscript(_ element: Element) -> Int {
        if let count = store[element] {
            return count
        } else {
            return 0
        }
    }
    
    mutating func union(with otherSet: CountedSet) {
        for element in otherSet {
            increment(element, by: otherSet[element])
        }
    }
    
    func unioned(with otherSet: CountedSet) -> CountedSet {
        var result = self
        for element in otherSet {
            result.increment(element, by: otherSet[element])
        }
        return result
    }
    
    func intersection(with otherSet: CountedSet) -> CountedSet {
        var result = CountedSet()
        for element in otherSet {
            if let count = store[element] {
                result.increment(element, by: otherSet[element] + count)
            }
        }
        return result
    }
    
    mutating func subtract(_ otherSet: CountedSet) {
        for element in otherSet {
            decrement(element, by: otherSet[element])
        }
    }
    
    func subtracting(_ otherSet: CountedSet) -> CountedSet {
        var result = self
        for element in otherSet {
            result.decrement(element, by: otherSet[element])
        }
        return result
    }
    
    func isDisjoint(_ otherSet: CountedSet) -> Bool {
        for element in otherSet {
            if contains(element) {
                return false
            }
        }
        return true
    }
    
    var count: Int { store.count }
    var isEmpty: Bool { store.isEmpty }
    
    // MARK: - Private
    
    private var store: [Element: Int] = [:]
}

// MARK: - Array Literal Expressible Confromance

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

// MARK: - Sequence Conformance

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

// MARK: - Equatable Conformance

extension CountedSet: Equatable {
    static func == (lhs: CountedSet, rhs: CountedSet) -> Bool {
        guard lhs.store.keys == rhs.store.keys else { return false }
        
        for element in lhs {
            if lhs[element] != rhs[element] {
                return false
            }
        }
        
        return true
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

var countedStrings: CountedSet<String> = ["a", "a", "b", "c", "d"]
var otherStrings: CountedSet<String> = ["a", "c", "e", "g", "h"]

var intersection = countedStrings.intersection(with: otherStrings)

intersection.subtract(otherStrings)
intersection.isDisjoint(countedStrings)
let newStrings: CountedSet<String> = ["x", "y", "z"]
let sameStrings: CountedSet<String> = ["x", "y", "z"]
intersection.isDisjoint(newStrings)

newStrings == sameStrings
newStrings == countedStrings
