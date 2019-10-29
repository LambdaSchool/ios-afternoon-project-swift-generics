import Foundation

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
    //    private(set) var storage =  [ Element : Element ].self
    
    typealias ArrayLiteralElement = Element
    
    private(set) var storage = [Element : Int]()
    
    init(arrayLiteral elements: Element...) {
        
        for element in elements {
            insert(element: &element)
            // Array literal
            storage[element] = storage[element] ?? 0 + 1
            removeDuplicates(sequence: element)
            
        }
    }
    
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
    
    func count() -> Int {
        return storage.count
    }
        
        
    mutating func insert(element: inout Element) {
            if storage[element] != nil {
            
//                        element.hashValue += 1
                storage[element] = (storage[element] ?? 0) + 1
            
            } else {
                storage[element] = (storage[element] ?? 0) + 1
        }
    
    
    
    mutating func remove(element: Element) -> Int? {
        
        let count = storage[element] ?? 0
        
        if count > 0 {
            storage[element] = count - 1
        
    }

        
    }
        func removeDuplicates<S: Sequence>(sequence: S) -> [S.Element] where S.Element: Hashable {
            let result: Set<S.Element> = Set(sequence)
            return Array(result)
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





