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

extension CountedSet: Equatable {
    static func == (lhs: CountedSet, rhs: CountedSet) -> Bool {
        return lhs.innerDict == rhs.innerDict
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

print("\n")
dump(myCountedSet)
print("\nUnique items in set: \(myCountedSet.count)")
print("isEmpty = \(myCountedSet.isEmpty)\n")

// Equatable Stretch Goal Test
var equatableSet1: CountedSet<String> = ["Good Morning", "Good Afternoon", "Good Night"]
var equatableSet2: CountedSet<String> = ["Good Morning", "Good Afternoon", "Good Night"]
print("equatableSet1 == equatableSet2 = \(equatableSet1 == equatableSet2)")

var nonEquatableSet: CountedSet<String> = ["Hello", "Goodbye"]
print("equatableSet1 == nonEquatableSet = \(equatableSet1 == nonEquatableSet)")
