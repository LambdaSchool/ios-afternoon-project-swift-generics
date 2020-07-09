import Foundation

enum Arrow {
    case iron, wooden, elven, dwarvish, magic, silver
}

struct CountedSet<Member: Hashable> {
    private(set) var countedSet = [Member: Int]()
    
//Add Member
    mutating func insert(_ element: Member) {
        countedSet[element] = (countedSet[element] ?? 0) + 1
    }
//Remove Member
    mutating func remove(_ element: Member) {
        let temp = countedSet[element] ?? 0
        
        if temp > 0 {
            countedSet[element] = temp - 1
        }
    }
    
}
// Count
extension CountedSet {
    subscript(_ item: Member) -> Int {
        return countedSet[item] ?? 0
    }
    
    var count: Int {
        return countedSet.count
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    
    typealias ArrayLiteralElement = Member
    
    init(arrayLiteral elements: Member...) {
        for element in elements {
            countedSet[element] = (countedSet[element] ?? 0) + 1
        }
        
    }
}

var firstCountedSet = CountedSet<Arrow>()
firstCountedSet.insert(.wooden)
firstCountedSet.insert(.iron)
firstCountedSet.insert(.wooden)
firstCountedSet.insert(.silver)
firstCountedSet.insert(.iron)

firstCountedSet[.iron]
firstCountedSet.count
firstCountedSet.remove(.wooden)



