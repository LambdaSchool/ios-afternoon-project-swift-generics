import Foundation

/*
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<AArrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
*/

struct CountedSet<E: Hashable> {
	private (set) var elements: [E]?
	
	subscript(_ element: E) -> Int {
		guard let elements = elements else { return 0 }
		return elements.count
	}
}

enum Arrow { case iron, elven, dwarvish, magic, silver }


var aCountedSet = CountedSet<Arrow>(elements: [.dwarvish, .elven, .iron])
aCountedSet[.iron]


//var myCountedSet: CountedSet<Arrow> = [.iron]
//myCountedSet[.iron] // 4
