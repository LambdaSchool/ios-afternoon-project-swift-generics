//
//  main.swift
//  CountedSet
//
//  Created by Jon Bash on 2019-12-03.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

// MARK: - Basic Implementation

struct CountedSet<Element: Hashable> {
    typealias ElementSet = CountedSet<Element>
    
    private var values = [Element: Int]()
    
    subscript(_ member: Element) -> Int {
        get {
            return values[member] ?? 0
        }
        set(newCount) {
            values[member] = newCount > 0 ? newCount : nil
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
    
    @discardableResult mutating func remove(_ element: Element) -> Int {
        let count = self[element]
        values[element] = count >= 1 ? count - 1 : nil
        return self[element]
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
    func union(with otherSet: ElementSet) -> ElementSet {
        var newSet = self
        for (element, count) in otherSet {
            newSet[element] += count
        }
        return newSet
    }
    
    mutating func formUnion(with otherSet: ElementSet) {
        self = self.union(with: otherSet)
    }
    
    static func +(lhs: ElementSet, rhs: ElementSet) -> ElementSet {
        return lhs.union(with: rhs)
    }

// MARK: - Intersection/Subtraction
    
    func intersection(with otherSet: ElementSet) -> ElementSet {
        var newSet = ElementSet()
        for (element, count) in self {
            newSet[element] = Swift.min(count, otherSet[element])
        }
        return newSet
    }
    
    mutating func formIntersection(with otherSet: ElementSet) {
        self = self.intersection(with: otherSet)
    }
    
    func subtracting(_ otherSet: ElementSet) -> ElementSet {
        var newSet = ElementSet()
        for (element, count) in self {
            newSet[element] = count - otherSet[element]
        }
        return newSet
    }
    
    mutating func subtract(_ otherSet: ElementSet) {
        self = self.subtracting(otherSet)
    }
    
    static func -(lhs: ElementSet, rhs: ElementSet) -> ElementSet {
        return lhs.subtracting(rhs)
    }

// MARK: - isDisjoint

    func isDisjoint(with otherSet: ElementSet) -> Bool {
        for (element, _) in self {
            if otherSet.contains(element) { return false }
        }
        return true
    }
}

// MARK: - Equatable

extension CountedSet: Equatable {
    func toDictionary() -> [Element: Int] {
        return values
    }
    
    static func ==(_ lhs: ElementSet, _ rhs: ElementSet) -> Bool {
        return lhs.toDictionary() == rhs.toDictionary()
    }
}

// MARK: - CustomStringConvertible

extension CountedSet: CustomStringConvertible {
    var description: String {
        return values.description
    }
}

// MARK: - (tests)

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
print(aCountedSet[.iron]) // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
print(myCountedSet[.iron]) // 4
print(myCountedSet.remove(.iron)) // 3
print(myCountedSet.remove(.dwarvish)) // 0
print(myCountedSet.remove(.magic)) // 0

var comparingCountedSet: CountedSet = ["gah", "gah", "gah", "woohoo", "whoops", "woohoo", "argh"]
var equalCountedSet = CountedSet(arrayLiteral: "gah", "gah", "woohoo", "whoops", "woohoo", "argh", "gah")
var unequalCountedSet: CountedSet = ["gah", "gah", "gah", "woohoo", "whoops", "woohoo", "gah", "woohoo", "huzzah?", "gah"]

print(comparingCountedSet == equalCountedSet)
print(comparingCountedSet == unequalCountedSet)
print("unequal:       \(unequalCountedSet)")
print("comparing:     \(comparingCountedSet)")
print("subtracted:    \(unequalCountedSet - comparingCountedSet)")
print("intersection:  \(unequalCountedSet.intersection(with: comparingCountedSet))")
print("union:         \(unequalCountedSet + comparingCountedSet)")

var disjointSet: CountedSet = ["BLAH", "YO", "SUP", "SUP"]
print("disjointSet:   \(disjointSet)")
print("trueDisjoint:  \(comparingCountedSet.isDisjoint(with: disjointSet))")
print("falseDisjoint: \(comparingCountedSet.isDisjoint(with: unequalCountedSet))")
