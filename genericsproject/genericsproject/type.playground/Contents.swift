import UIKit
import Foundation


// Struct with Dictionary
struct CountedSet<Element: Hashable> {
    private(set) var elementsCount = [Element: Int]()
}

// Insert and remove

extension CountedSet {
    // Insert one element at a time
    mutating func insert(element: Element) {
       elementsCount[element] = (elementsCount[element] ?? 0) + 1
    }
    
    // Remove one element at a time
    mutating func remove(element: Element) {
        let x = (elementsCount[element] ?? 0)
        if x > 0 {
            elementsCount[element] = x - 1
        }
    }
}


// Count implementation
extension CountedSet {
    var count: Int? {
        if elementsCount.count == 0 {
            return nil
        }
    return elementsCount.count
    }
}

// Subscript
extension CountedSet {
    subscript(_ member: Element) -> Int {
        return elementsCount[member] ?? 0
    }
}

//  Make CountedSet from Array
extension CountedSet: ExpressibleByArrayLiteral {
    
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            elementsCount[element] = (elementsCount[element] ?? 0) + 1
        }
    }
}

// Tests
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var a = CountedSet<Arrow>()

print(a[.iron])

var setfromArray: CountedSet<Arrow> = [.magic, .silver, .dwarvish, .dwarvish, .silver, .silver, .magic, .magic]

print(setfromArray[.magic])

setfromArray.remove(element: .magic)
print(setfromArray[.magic])

setfromArray.insert(element: .iron)
print(setfromArray[.iron])
