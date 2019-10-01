import UIKit

struct CountedSet<T: Hashable>: ExpressibleByArrayLiteral {
    
    typealias ArrayLiteralElement = T
    
    private(set) var elements: [T]
    
    init(arrayLiteral elements: T...) {
        var holderArray:[T] = []
        for element in elements {
            holderArray.append(element)
        }
        self.elements = holderArray
    }
    
    mutating func insert(element: T) {
        elements.append(element)
    }
    
    mutating func remove(element: T) -> [T]? {
        
        if elements.count > 0 {
            var newArray: [T] = []
            for elementRep in elements {
                if elementRep != element {
                    newArray.append(elementRep)
                }
                
            }
            elements = newArray
            return newArray
        } else {
            return nil
        }
    }
    
    func totalCount() -> Int {
        var totalCount = 0
        for _ in elements {
            totalCount += 1
        }
        return totalCount
    }
    
    func elementCount(element: T) -> Int {
        var elementCount = 0
        for i in elements {
            if i == element {
                elementCount += 1
            }
        }
        return elementCount
    }
    
    subscript(_ index: T) -> Int {
        var itemCount = 0
        for element in elements {
            if element == index {
                itemCount += 1
            }
        }
        return itemCount
    }
}

enum Arrow {
    case iron
    case wooden
    case elven
    case dwarvish
    case magic
    case silver
}

var aCountedSet = CountedSet<Arrow>()
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

aCountedSet[.iron]
aCountedSet[.wooden]
myCountedSet.elementCount(element: .iron)
myCountedSet.totalCount()
myCountedSet.remove(element: .iron)
myCountedSet[.magic]
myCountedSet.remove(element: .magic)
myCountedSet.remove(element: .silver)
myCountedSet.totalCount()
myCountedSet.remove(element: .iron)


