import Foundation

struct CountedSet<T:Hashable> {
    private var innerDict: [T:Int] = [:]
    
    mutating func insert(_ ele: T) {
        guard innerDict[ele] != nil else {
            innerDict[ele] = 1
            return
        }
        innerDict[ele]! += 1
    }
    
    func remove(_ ele: T) {
        
    }
    
    subscript(_ member: T) -> Int {
        guard innerDict[member] != nil else { return 0 }
        return innerDict[member]!
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet.insert(.iron)
aCountedSet.insert(.iron)
print(aCountedSet[.iron])
aCountedSet.insert(.magic)
print(aCountedSet[.magic])
//var myCountedSet: CountedSet<Arrow> = [.iron, .wooden, .magic, .magic]

