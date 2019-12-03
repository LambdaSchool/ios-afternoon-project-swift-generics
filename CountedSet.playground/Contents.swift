import Foundation

// MARK: - Basic Implementation

struct CountedSet<Element: Hashable> {
    private var values = [Element: Int]()
    
    subscript(_ member: Element) -> Int {
        get {
            return values[member] ?? 0
        }
    }
    
    var count: Int {
        return values.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func insert(_ newElement: Element) {
        values[newElement] = (values[newElement] ?? 0) + 1
    }
    
    mutating func remove(_ element: Element) -> Int {
        if contains(element) {
            values[element]! -= 1
            if values[element] == 0 {
                values[element] = nil
            }
        }
        return values[element] ?? 0
    }
    
    func contains(_ element: Element) -> Bool {
        return values[element] != nil
    }
}

// MARK: - ExpressibleByArrayLiteral

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        elements.forEach { element in
            insert(element)
        }
    }
    
    typealias ArrayLiteralElement = Element
}

// MARK: - Sequence

extension CountedSet: Sequence {
    __consuming func makeIterator() -> DictionaryIterator<Element, Int> {
        return values.makeIterator()
    }
}

// MARK: - Union

extension CountedSet {
    mutating func formUnion(_ otherSet: CountedSet<Element>) {
        for element in otherSet {
            values[element.key] = (values[element.key] ?? 0) + element.value
        }
    }
    
    func union(_ otherSet: CountedSet<Element>) -> CountedSet<Element> {
        var newSet = self
        newSet.formUnion(otherSet)
        return newSet
    }

// MARK: - Intersection/Subtraction
    
    private init(_ set: CountedSet<Element>, intersectingSet: CountedSet<Element>) {
        for (element, count) in intersectingSet {
            let newElementCount: Int
            if self.contains(element) && self[element] > count {
                 newElementCount = self[element]
            } else {
                newElementCount = count
            }
            values[element] = newElementCount
        }
    }

    func intersection(_ otherSet: CountedSet<Element>) -> CountedSet<Element> {
        return CountedSet<Element>(self, intersectingSet: otherSet)
    }
    
    mutating func subtract(_ otherSet: CountedSet<Element>) {
        for (element, _) in self {
            if otherSet.contains(element) {
                values[element]! -= otherSet[element]
                if values[element]! < 0 { remove(element) }
            }
        }
    }
    
    func subtracting(_ otherSet: CountedSet<Element>) -> CountedSet<Element> {
        var newSet = self
        newSet.subtract(otherSet)
        return newSet
    }

// MARK: - isDisjoint

    var isDisjoint: Bool {
        return true
    }
}

// MARK: - Equatable

extension CountedSet: Equatable {
    func toDictionary() -> [Element: Int] {
        return values
    }
    
    static func ==(_ lhs: CountedSet<Element>, _ rhs: CountedSet<Element>) -> Bool {
        return lhs.toDictionary() == rhs.toDictionary()
    }
}

// MARK: - (tests)

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0

var comparingCountedSet: CountedSet = ["gah", "gah", "gah", "woohoo", "whoops", "woohoo", "argh"]
var equalCountedSet: CountedSet<String> = CountedSet(arrayLiteral: "gah", "gah", "woohoo", "whoops", "woohoo", "argh", "gah")
var unequalCountedSet: CountedSet = ["gah", "gah", "gah", "woohoo", "whoops", "woohoo", "argh", "whoops"]

print(comparingCountedSet == equalCountedSet)
print(comparingCountedSet == unequalCountedSet)
