import UIKit

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
    private(set) var elements = [Element: Int]()
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element: element)
        }
    }
    
    mutating func insert(element: Element) {
        if let _ = elements[element] {
            elements[element]! += 1
        } else {
            elements[element] = 1
        }
    }
    
    mutating func remove(element: Element) {
        guard let _ = elements[element] else { return }
        elements[element]! -= 1
        
        if elements[element] == 0 {
            elements.removeValue(forKey: element)
        }
    }
    
    subscript(_ element: Element) -> Int {
        guard let elementCount = elements[element] else { return 0 }
        return elementCount
    }
    
    func count() -> Any {
        if elements.isEmpty {
            return elements.isEmpty
        } else {
            return elements.count
        }
    }
    
    // MARK: - Stretch Goals
    
    func contains(_ element: Element) -> Bool {
        if let _ = elements[element] {
            return true
        } else {
            return false
        }
    }
    
    mutating func union(_ elementArray: inout CountedSet) -> CountedSet {
        while !elementArray.elements.keys.isEmpty {
            for element in elementArray.elements.keys {
                self.insert(element: element)
                elementArray.remove(element: element)
            }
        }
        
        return self
    }
    
    func unioned(_ elementArray: CountedSet) -> CountedSet {
        var result = self
        var unionFrom = elementArray
        
        while !unionFrom.elements.keys.isEmpty {
            for element in unionFrom.elements.keys {
                result.insert(element: element)
                unionFrom.remove(element: element)
            }
        }
        
        return result
    }
}

// MARK: - Tests

var countedStuff: CountedSet<String> = ["Jeremy", "Hunter", "Jeremy"]
countedStuff.insert(element: "Jeremy")
countedStuff.remove(element: "Hunter")
countedStuff.insert(element: "Spencer")
countedStuff.remove(element: "Jeremy")
countedStuff.remove(element: "Hunter")
print(countedStuff["Jeremy"])
print(countedStuff.count())
print(countedStuff)

var countedStuffTwo: CountedSet<String> = ["Hunter", "Spencer", "Jeremy"]

countedStuff.unioned(countedStuffTwo)
countedStuff
countedStuffTwo

countedStuff.union(&countedStuffTwo)
countedStuff
countedStuffTwo
