import UIKit

struct CountedSet<Element: Hashable> {
    
    // MARK: Properties
    var elements: [Element: Int] =  [:]
    var count: Int {
        return elements.count
    }
    var isEmpty: Bool {
        return self.count == 0 ? true : false
    }
    
    //MARK: Methods
    mutating func insert(_ element: Element) {
        elements[element, default:0] += 1
    }
    
    mutating func remove(_ element: Element) {
        guard let count = elements[element] else { return }
            if count == 1 {
                elements.removeValue(forKey: element)
            } else {
                self.elements[element, default: 0] -= 1
            }
    }
    
    func contains(_ element: Element) -> Bool {
               if let _ = elements[element] {
                   return  true
               }
               return false
           }
    
    subscript(_ member: Element) -> Int {
    get {
        return elements[member, default: 0]
    }
    set(newValue) {
        elements[member, default: 0] = newValue
    }
  }
}

//Conform to ExpressibleByArrayLiteral
extension CountedSet: ExpressibleByArrayLiteral {
      init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

// MARK: Tests

print("Test 1")
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0

print("Test 2")
   var array = CountedSet<String>()
       array.insert("String1")
       array.insert("String2")
       array.insert("String2")
       array.insert("String3")
       array.insert("String3")
       array.insert("String3")
       array.insert("String4")
       array.insert("String4")
       array.insert("String4")
       array.insert("String4")
       print(array)
