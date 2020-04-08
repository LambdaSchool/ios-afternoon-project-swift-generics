import Cocoa

struct CountedSet<Element> : ExpressibleByArrayLiteral where Element: Hashable  {
    
    private(set) var dictionary: [Element : Int] = [:]
    
        init(arrayLiteral elements: Element...) {
            for element in elements {
                insert(element)
            }
    }
    
    mutating func insert(_ element: Element) -> Int {
      if dictionary.keys.contains(element) {
        dictionary[element]! += 1
        return dictionary[element]!
      } else {
        dictionary[element] = 1
        return dictionary[element]!
      }
    }
    
    mutating func remove(_ element: Element) -> Int {
        if dictionary.keys.contains(element) {
          dictionary[element]! -= 1
            if dictionary[element]! == 0 {
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

