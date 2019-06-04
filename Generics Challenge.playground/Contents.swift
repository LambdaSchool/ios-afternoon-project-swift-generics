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

	// MARK: - subtraction
	/// returns a CountedSet that is the result of subtracting a new set from the original
	func subtraction(of newSet: CountedSet<Element>) -> CountedSet<Element> {
		var tSet = self
		tSet.subtracted(newSet)
		return tSet
	}

	/// takes a CountedSet and subtracts counts from self
	mutating func subtracted(_ newSet: CountedSet<Element>) {
		for item in newSet {
			self[item.member] -= item.count
		}
	}

	// MARK: - intersection
	/// Returns a new CountedSet where the items and counts directly overlap with the new set
	func intersected(with newSet: CountedSet<Element>) -> CountedSet<Element> {
		var tSet = CountedSet<Element>()
		for item in newSet {
			if self[item.member] != 0 && self[item.member] == item.count {
				tSet[item.member] = item.count
			}
		}
		return tSet
	}

	mutating func intersection(with newSet: CountedSet<Element>) {
		self = intersected(with: newSet)
	}

	// MARK: - Union
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
func basicTests() {
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
}
basicTests()

func unionTests() {
	var aCountedSet = CountedSet<Arrow>()
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
		bArray.append(.magic)
	}
	for _ in 1...20 {
		bArray.append(.elven)
	}
	let bCountedSet = CountedSet(bArray)

	let cCountedSet = aCountedSet.unioned(with: bCountedSet)
	aCountedSet

	aCountedSet.union(with: bCountedSet)

	// MARK: - equality tests
	aCountedSet == cCountedSet
	aCountedSet == bCountedSet
	aCountedSet != cCountedSet
	aCountedSet != bCountedSet
}
unionTests()

// MARK: - intersection tests
func testIntersection() {
	var aCountedSet = CountedSet<Arrow>()
	for _ in 1...5 {
		aCountedSet.insert(.dwarvish)
	}
	for _ in 1...2 {
		aCountedSet.insert(.elven)
	}
	for _ in 1...1 {
		aCountedSet.insert(.iron)
	}

	var bCountedSet = CountedSet<Arrow>()
	for _ in 1...4 {
		bCountedSet.insert(.dwarvish)
	}
	for _ in 1...2 {
		bCountedSet.insert(.elven)
	}

	_ = aCountedSet.intersected(with: bCountedSet)
	aCountedSet
	bCountedSet

	aCountedSet.intersection(with: bCountedSet)
	aCountedSet
	bCountedSet
}
testIntersection()


// MARK: - subtraction tests
func testSubtraction() {
	var aCountedSet = CountedSet<Arrow>()
	for _ in 1...5 {
		aCountedSet.insert(.dwarvish)
	}
	for _ in 1...2 {
		aCountedSet.insert(.elven)
	}
	for _ in 1...1 {
		aCountedSet.insert(.iron)
	}

	var bCountedSet = CountedSet<Arrow>()
	for _ in 1...4 {
		bCountedSet.insert(.dwarvish)
	}
	for _ in 1...2 {
		bCountedSet.insert(.elven)
	}

	_ = aCountedSet.subtraction(of: bCountedSet)
	aCountedSet
	bCountedSet

	aCountedSet.subtracted(bCountedSet)
	aCountedSet
	bCountedSet
}
testSubtraction()
