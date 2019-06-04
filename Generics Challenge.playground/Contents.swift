import Cocoa

struct CountedSet<Element: Hashable> {
	private var contents: [Element: Int] = [:]

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
	init(arrayLiteral: Element...) {
		self.init()
		for element in arrayLiteral {
			self.insert(element)
		}
	}
}
