import Foundation



struct CountedSet<Element: Hashable> {
    private(set) var backingStorageDictionary = [Element: Int]()

    var count = 0

    // create an insert method for one element at a time
    mutating func insert(_ item: Element) {
        if backingStorageDictionary.keys.contains(item) {
            backingStorageDictionary[item]! += 1
        } else {
            backingStorageDictionary[item] = 1
        }
    }

    // create a removal method of one item at a time
    mutating func remove(_ item: Element) {
        if backingStorageDictionary.keys.contains(item) {
            count = backingStorageDictionary[item] ?? 0
            if count > 0 {
                backingStorageDictionary[item] = count - 1
            }
        } else {
            backingStorageDictionary[item] = 0
        }
    }

    // create a method to provide count of unique entries in set
    mutating func entryCount() -> Int {
        guard !backingStorageDictionary.isEmpty else { return 0 }
        return backingStorageDictionary.count
    }


    subscript(_ member: Element) -> Int {
        return backingStorageDictionary[member] ?? 0
    }

}

// Conform  set to ExpressibleByArrayLiteral so you can initialize a counted set using an array of same-type items.

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for item in arrayLiteral {
            self.insert(item)
        }
    }
}


//  Implementation should support the following interaction style:

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
myCountedSet[.dwarvish]
myCountedSet.insert(.silver)
myCountedSet.insert(.elven)
myCountedSet.insert(.wooden)
myCountedSet[.silver]
myCountedSet[.elven]
myCountedSet.entryCount()

enum Magic { case fire, elven, water, air, death, healing }

var magesCountedSet: CountedSet<Magic> = [.air, .death, .fire, .death, .elven, .air, .fire]
magesCountedSet[.death]
magesCountedSet.remove(.death)
magesCountedSet.remove(.fire)
magesCountedSet.insert(.air)
magesCountedSet.insert(.elven)
magesCountedSet[.death]
magesCountedSet[.air]
magesCountedSet.remove(.death)
magesCountedSet.entryCount()
