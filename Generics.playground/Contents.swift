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
        return innerDict[member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: T...) {
        self.init()
        for T in arrayLiteral {
            self.insert(T) // insert instead of append
        }
    }
}

// Test
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
print(aCountedSet[.iron])
print("aCountedSet.isEmpty = \(aCountedSet.isEmpty)")

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
print(myCountedSet[.iron]) // 4

myCountedSet.remove(.iron)
print(myCountedSet[.iron]) // 3

myCountedSet.remove(.dwarvish)
print(myCountedSet[.dwarvish]) // 0

myCountedSet.remove(.magic)
print(myCountedSet[.magic]) // 0

dump(myCountedSet)
print("\nUnique items in set: \(myCountedSet.count)")
print("isEmpty = \(myCountedSet.isEmpty)")
