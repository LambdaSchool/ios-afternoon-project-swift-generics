import UIKit
import Foundation

struct CountedSet<Element: Hashable> {
    
    private(set) var dictionary: [Element: Int] = [:]
    var count = 0
    
    mutating func insert(_ element: Element) {
        if dictionary.keys.contains(element) {
            dictionary[element]! += 1
        } else {
            dictionary[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) {
        if dictionary.keys.contains(element) {
            count = dictionary[element] ?? 0
            if count > 0 {
                dictionary[element] = count - 1
            }
        } else {
            dictionary[element] = 0
        }
    }
    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0
    }
}
// MARK: - EXTENSION
extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
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
