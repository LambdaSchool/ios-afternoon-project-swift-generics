import Foundation

/*
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
*/

struct CountedSet<H: Hashable> {
	var Arr: [H]
}

enum Arrow {
	case iron, elven, dwarvish, magic, silver
}

var aCountedSet = CountedSet<Arrow>(Arr: [.elven])

