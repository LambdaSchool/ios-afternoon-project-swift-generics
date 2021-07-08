import Foundation


struct CountedSet<T: Hashable> {
    
    private var countedSet = [T:Int]()
    
    mutating func insert(item: T) -> Int{
        if let index = countedSet.index(forKey: item) {
            var count = countedSet[index].value
            count += 1
            countedSet.updateValue(count, forKey: item)
            return count
        } else {
            countedSet.updateValue(1, forKey: item)
            return 1
        }
    }
    
    mutating func remove(item: T) -> Int{
        if let index = countedSet.index(forKey: item) {
            var count = countedSet[index].value
            count -= 1
            if count == 0 {
                countedSet.remove(at: index)
                return count
            } else {
                countedSet.updateValue(count, forKey: item)
                return count
            }
        } else {
            return 0
        }
    }
    
    subscript(_ member: T) -> Int {
        if let index = countedSet.index(forKey: member) {
            return countedSet[index].value
        } else {
            return 0
        }
    }
    
    func count() -> Int {
        return countedSet.count
    }
    
}

extension CountedSet: ExpressibleByArrayLiteral {
        init(arrayLiteral elements: T...) {
        self.init()
        for element in elements {
            countedSet[element] = (countedSet[element] ?? 0) + 1
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(item: .iron) // 3
myCountedSet.remove(item: .dwarvish) // 0
myCountedSet.remove(item: .magic) // 0
