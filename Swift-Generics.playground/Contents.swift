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


var dict = ["a": 1, "b": 2, "c": 3]
dict["c"] = 4
dict["d"] = 1


dict

struct CountedSet<E: Hashable> {
	private (set) var contents: [E: Int] = [:]
	
	//get set
	subscript(_ member: E) -> Int {
		
		return contents[member, default: 0]
	}
	
	mutating func insert(_ member: E) {
		contents[member, default: 0] += 1
	}
	
	mutating func remove(_ member: E) {
		if let value = contents[member] {
			if value > 1 {
				contents[member, default: 0] -= 1
			} else {
				contents.removeValue(forKey: member)
			}
			
		}
	}

}

extension CountedSet: ExpressibleByArrayLiteral {
	
	
	
}


enum Arrow { case iron, elven, dwarvish, magic, silver }


var aCountedSet = CountedSet<Arrow>()
//aCountedSet[.iron]
aCountedSet.insert(.elven)
aCountedSet[.elven]
aCountedSet.remove(.elven)
aCountedSet


//var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

//var myCountedSet: CountedSet<Arrow> = [.iron]
//myCountedSet[.iron] // 4
