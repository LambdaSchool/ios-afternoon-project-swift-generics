import UIKit


struct CountedSet<Element: Hashable> {
    var elements = [Element]()
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
            if let value = dictionary[member] {
                return value
            } else {
                return 0
            }
        }
    }
}





enum Arrow {
    case iron, wooden, elven, dwarvish, magic, silver
}

var aCountedSet = CountedSet<Arrow>()
//aCountedSet[.iron]

print(aCountedSet)


//var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.append(element)
        }
    }
}
