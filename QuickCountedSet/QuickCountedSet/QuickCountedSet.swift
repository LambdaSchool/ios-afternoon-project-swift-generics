//
//  QuickCountedSet.swift
//  QuickCountedSet
//
//  Created by Michael Redig on 6/4/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import Foundation

struct QuickCountedSet<Element: Hashable> {
	private(set) var contents: [Element: Int] = [:]

	var count: Int {
		return contents.isEmpty ? 0 : contents.count
	}

	func contains(_ member: Element) -> Bool {
		return contents[member] != nil
	}

	subscript(_ member: Element) -> Int {
		get {
			return contents[member, default: 0]
		}

		set {
			if newValue <= 0 {
				contents[member] = newValue
				remove(member)
			} else {
				if !contains(member) {
					insert(member)
				}
				contents[member] = newValue
			}
		}
	}

	mutating func insert(_ element: Element) {
		contents[element, default: 0] += 1
	}

	mutating func remove(_ element: Element) {
		if let count = contents[element] {
			if count > 1 {
				contents[element] = count - 1
			} else {
				contents.removeValue(forKey: element)
			}
		}
	}

	func isDisjoint(_ otherSet: QuickCountedSet<Element>) -> Bool {
		for item in otherSet {
			if self[item.member] == item.count {
				return false
			}
		}
		return true
	}

	// MARK: - subtraction
	/// returns a QuickCountedSet that is the result of subtracting a new set from the original
	func subtracted(_ newSet: QuickCountedSet<Element>) -> QuickCountedSet<Element> {
		var tSet = self
		tSet.subtraction(newSet)
		return tSet
	}

	/// takes a QuickCountedSet and subtracts counts from self
	mutating func subtraction(_ newSet: QuickCountedSet<Element>) {
		for item in newSet {
			self[item.member] -= item.count
		}
	}

	// MARK: - intersection
	/// Returns a new QuickCountedSet where the items and counts directly overlap with the new set
	func intersected(with newSet: QuickCountedSet<Element>) -> QuickCountedSet<Element> {
		var tSet = QuickCountedSet<Element>()
		for item in newSet {
			if self[item.member] != 0 && self[item.member] == item.count {
				tSet[item.member] = item.count
			}
		}
		return tSet
	}

	mutating func intersection(with newSet: QuickCountedSet<Element>) {
		self = intersected(with: newSet)
	}

	// MARK: - Union
	func unioned(with newSet: QuickCountedSet<Element>) -> QuickCountedSet<Element> {
		var tSet = self
		for item in newSet {
			tSet[item.member] += item.count
		}
		return tSet
	}

	mutating func union(with newSet: QuickCountedSet<Element>) {
		self = unioned(with: newSet)
	}
}

extension QuickCountedSet: ExpressibleByArrayLiteral {
	init(_ array: [Element]) {
		self.init()
		for item in array {
			insert(item)
		}
	}

	init(arrayLiteral: Element...) {
		self.init(arrayLiteral)
	}
}


extension QuickCountedSet: CustomStringConvertible {
	var description: String {
		return "\(contents)"
	}
}

extension QuickCountedSet: Sequence {
	func makeIterator() -> CountedSetIterator<Element, Int> {
		return CountedSetIterator(contents: contents)
	}
}

extension QuickCountedSet: Equatable {}

struct CountedSetIterator<Element: Hashable, Int>: IteratorProtocol {
	let contents: [Element: Int]
	var contentsIterator: DictionaryIterator<Element, Int>

	init(contents: [Element: Int]) {
		self.contents = contents
		contentsIterator = contents.makeIterator()
	}

	mutating func next() -> (member: Element, count: Int)? {
		guard let nextValue = contentsIterator.next() else { return nil }
		return (nextValue.key, nextValue.value)
	}
}
