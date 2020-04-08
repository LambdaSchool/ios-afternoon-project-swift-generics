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
            self.increment(element, by: otherSet[element])
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
            if let count = store[element], count == otherSet[element] {
                result.increment(element, by: count)
            }
        }
        return result
    }
    
    mutating func subtract(_ otherSet: CountedSet) {
        for element in otherSet {
            self.decrement(element, by: otherSet[element])
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
        for element in otherSet  {
            if self.contains(element) { return false }
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




var letters: CountedSet<String> = []

letters.insert("a")
assert(letters["a"] == 1, "Insert failed")

letters.remove("a")
assert(letters["a"] == 0, "Remove failed")

letters.increment("a", by: 10)
assert(letters["a"] == 10, "Increment failed")

letters.decrement("a", by: 9)
assert(letters["a"] == 1, "Decrement failed")

let lettersBC: CountedSet<String> = ["b", "c"]
let lettersABC: CountedSet<String> = ["a", "b", "c"]
assert(letters.unioned(with: lettersBC) == lettersABC, "Unioned failed")

letters.union(with: lettersBC)
assert(letters == lettersABC, "Union failed")

let intersection = letters.intersection(with: lettersBC)
assert(intersection == lettersBC, "Intersection failed")

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0

myCountedSet.contains(.iron)

