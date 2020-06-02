import UIKit


struct CountedSet<Element: Hashable> {
    
    private(set) var dictionary = [Element: Int]()
      
    
    mutating func insert(key: Element) {
        if var value = dictionary[key] {
            value += 1
            dictionary[key] = value
        } else {
            dictionary[key] = 1
        }
    }
    
    
    mutating func remove(key: Element) {
        if var value = dictionary[key], value > 1 {
            value -= 1
            dictionary[key] = value
        } else {
            dictionary.removeValue(forKey: key)
        }
    }
    
    func count() -> Int {
        var count = 0
        for _ in dictionary.keys {
            count += 1
        }
        return count
    }

    
    func isEmpty() -> Bool {

        return self.count() == 0 ? true : false
    }
    
    subscript(_ member: Element) -> Int {
        get {
            guard let value = dictionary[member] else { return 0 }
            print("The value is: \(value)")
                return value
        }
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(key: element)
        }
    }
}





enum Arrow {
    case iron, wooden, elven, dwarvish, magic, silver
}

var aCountedSet = CountedSet<Arrow>()
print(aCountedSet)
aCountedSet.count()
aCountedSet[.iron] // 0
aCountedSet.insert(key: .iron)
aCountedSet.insert(key: .elven)
aCountedSet.insert(key: .elven)
aCountedSet.insert(key: .dwarvish)
aCountedSet.insert(key: .magic)
aCountedSet.insert(key: .magic)
aCountedSet.insert(key: .magic)
aCountedSet[.elven]
aCountedSet[.magic]
print(aCountedSet.dictionary)
aCountedSet[.iron]
aCountedSet.remove(key: .iron)
aCountedSet[.iron]


aCountedSet.count()

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet.count()
myCountedSet[.iron] // 4
myCountedSet.remove(key: .iron) // 3
myCountedSet[.iron]
myCountedSet.remove(key: .dwarvish) // 0
myCountedSet[.dwarvish]
myCountedSet.remove(key: .magic) // 0
myCountedSet[.magic]

var animals: CountedSet = ["cat", "cat", "dog", "bird", "bunny", "bunny", "bunny"]
print(animals)
animals.count()

