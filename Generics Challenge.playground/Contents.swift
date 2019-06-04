import Cocoa

struct CountedSet<Element: Hashable> {
	private(set) var contents: [Element: Int] = [:]
	

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

	func contains(_ member: Element) -> Bool {
		return contents[member] != nil
	}

	var count: Int {
		return contents.isEmpty ? 0 : contents.count
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
