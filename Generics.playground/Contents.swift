import Foundation

struct CountedSet<T:Hashable> {
    private var innerDict: [T:Int] = [:]
    
    var count: Int {
        return innerDict.count
    }
    
    var isEmpty: Bool {
        return innerDict.count == 0
    }
    
    mutating func insert(_ ele: T) {
        guard innerDict[ele] != nil else {
            // If element does not exist, add it to dictionary
            innerDict[ele] = 1
            return
        }
        
        // element does exist, increment count
        innerDict[ele]! += 1
    }
    
    mutating func remove(_ ele: T) {
        guard innerDict[ele] != nil else { return }
        
        // Decrement element count
        innerDict[ele]! -= 1
        
        // Remove from dictionary if less than 1
        if(innerDict[ele]! <= 0) {
            innerDict[ele] = nil
        }
    }
    
    // Return count of element in dictionary if it exists
    subscript(_ member: T) -> Int {
        guard innerDict[member] != nil else { return 0 }
        return innerDict[member]!
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet.insert(.magic)
print(aCountedSet[.magic])
//var myCountedSet: CountedSet<Arrow> = [.iron, .wooden, .magic, .magic]

