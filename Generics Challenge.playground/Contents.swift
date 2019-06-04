import Cocoa

struct CountedSet<Element: Hashable> {
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

	func unioned(with newSet: CountedSet<Element>) -> CountedSet<Element> {
		var tSet = self
		for item in newSet {
			tSet[item.member] += item.count
		}
		return tSet
	}

	mutating func union(with newSet: CountedSet<Element>) {
		self = unioned(with: newSet)
	}
}

extension CountedSet: ExpressibleByArrayLiteral {
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


extension CountedSet: CustomStringConvertible {
	var description: String {
		return "\(contents)"
	}
}

extension CountedSet: Sequence {
	func makeIterator() -> CountedSetIterator<Element, Int> {
		return CountedSetIterator(contents: contents)
	}
}

extension CountedSet: Equatable {}

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

// MARK: - tests

enum Arrow: String { case iron, wooden, elven, dwarvish, magic, silver }
extension Arrow: CustomStringConvertible {
	var description: String {
		return self.rawValue
	}
}
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0

for item in myCountedSet {
	print(item)
}

for _ in 1...3 {
	aCountedSet.insert(.dwarvish)
}
for _ in 1...5 {
	aCountedSet.insert(.elven)
}
for _ in 1...20 {
	aCountedSet.insert(.iron)
}

var bArray = [Arrow]()
for _ in 1...3 {
	aCountedSet.insert(.magic)
}
for _ in 1...20 {
	aCountedSet.insert(.elven)
}
var bCountedSet = CountedSet(bArray)

let cCountedSet = aCountedSet.unioned(with: bCountedSet)
cCountedSet

aCountedSet.union(with: bCountedSet)
aCountedSet

aCountedSet == cCountedSet
aCountedSet == bCountedSet
aCountedSet != cCountedSet
aCountedSet != bCountedSet

