import Cocoa

struct CountedSet<Element> : ExpressibleByArrayLiteral where Element: Hashable  {
    
    private(set) var dictionary: [Element : Int] = [:]
    
        init(arrayLiteral elements: Element...) {
            for element in elements {
                insert(element)
            }
    }
    
    mutating func insert(_ element: Element, _ count: Int = 1) -> Int {
      if dictionary.keys.contains(element) {
        dictionary[element]! += count
        return dictionary[element]!
      } else {
        dictionary[element] = 1
        return dictionary[element]!
      }
    }
    
    mutating func remove(_ element: Element, _ count: Int = 1) -> Int {
        if dictionary.keys.contains(element) {
          dictionary[element]! -= count
            if dictionary[element]! <= 0 {
                dictionary.removeValue(forKey: element)
                return 0
            } else {
               return dictionary[element]!
            }
        } else {
            dictionary.removeValue(forKey: element)
            return 0
        }
    }
    
    func contains(_ element: Element) -> Bool {
        if dictionary.keys.contains(element) {
            return true
        }
        return false
    }
    
    mutating func subtract(_ elements: CountedSet) {
        for (thing, count) in elements.dictionary {
            
            remove(thing, count)
        }
    }
    
    mutating func union(_ elements: CountedSet) {
        for (thing, count) in elements.dictionary {
            
            insert(thing, count)
        }
    }
    
    func unioned(_ elements: CountedSet) -> CountedSet {
        var theSet: CountedSet = elements
        
        for (thing, count) in dictionary {
            
            theSet.insert(thing, count)
        }
        
        return theSet
    }
    
    subscript(_ element: Element) -> Int {
    
        if dictionary.keys.contains(element) {
            guard let number = dictionary[element] else {return 0}
            
            return number
             } else {
            return 0
        }
        
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0

var cCountedSet = myCountedSet
myCountedSet.union(cCountedSet)


