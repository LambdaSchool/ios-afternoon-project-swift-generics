import UIKit
import Foundation

enum Arrow: Hashable {
    case iron
    case wooden
    case elven
    case dwarvish
    case magic
    case silver
}
struct CountedSet<Element : Hashable>  {
    
    private(set) var elements = Set<Element>()
    private(set) var storage = [Element:Int]()
    
    mutating func insert(element: Element) {
        elements.insert(element)
    }
    
      @discardableResult mutating func remove(_ element: Element) -> Int {
          let elementCount = storage[element] ?? 0
          storage[element] = elementCount >= 1 ? elementCount - 1 : nil
          return self[element]
      }
    
    func subcript(_ member: Element) -> Int {
        if !elements.contains(member) {
            print("Not contain.")
            return 0
        } else {
            let index = elements.distance(from: elements.firstIndex(of: elements.first!)!, to: elements.firstIndex(of: member)!)
            print("Contain ,position \(index).")
              return index
        }
    }
    
    subscript(_ member: Element) -> Int {
           if let quantity = storage[member] {
               return quantity
           } else {
               return 0
           }
    }
    
    func count() -> Int {
        return elements.count
    }
    
    
    func isEmpty() -> Bool {
        return elements.count == 0
    }
    
    

}

let test = CountedSet(elements: [2,6,7,77,7])
let test2 = CountedSet(elements: ["Nick","Hello"])


//MARK:- ExpressibleByArrayLiteral
extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: Element...) {
           for element in elements {
               storage[element] = (storage[element] ?? 0) + 1
           }
       }

}


var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
print(myCountedSet)
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
myCountedSet.insert(element: .elven)
//MARK:- Sequence
extension CountedSet: Sequence {
     func makeIterator() -> DictionaryIterator<Element, Int> {
        return storage.makeIterator()
    }
}
//MARK:- 
