import UIKit
import Foundation

struct CountedSet<Element : Hashable> {

    private (set) var inventory: [Element : Int] = [:]
    
    mutating func insert(_ entry: Element) {
        inventory[entry] = (inventory[entry] ?? 0) + 1
    }
    
    mutating func remove(_ entry: Element) {
        guard let amount = inventory[entry] else { return }
        
        inventory[entry] = amount - 1
    }
    
    mutating func countEntries() -> Int {
        
        guard !inventory.isEmpty else { return 0 }
        
        return inventory.count
    }
    
}

extension CountedSet {
    subscript(_ member: Element) -> Int {
        return inventory[member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron]
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
print(myCountedSet[.iron])
myCountedSet.remove(.iron)
print(myCountedSet[.iron])
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)
