import UIKit


struct CountedSet<Element: Hashable> {
    
    var stored = [Element]()
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
            print("This is the value: \(value)")
                return value
        }
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        stored = elements
    }
}





enum Arrow {
    case iron, wooden, elven, dwarvish, magic, silver
}

var aCountedSet = CountedSet<Arrow>()
print(aCountedSet)
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
print(myCountedSet)
myCountedSet[.iron] // 4
myCountedSet.remove(key: .iron) // 3
myCountedSet.remove(key: .dwarvish) // 0
myCountedSet.remove(key: .magic) // 0
