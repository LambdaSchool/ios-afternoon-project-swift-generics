import Foundation
import UIKit

struct Inventory<Element: Hashable> {
    private(set) var storage = [Element:Int]()
}

//----------------------------------------------------------------



enum Arrow { case iron, wooden, elven, dwarvish, magic, silver, black }
var creatingInventory = Inventory<Arrow>()

creatingInventory[.iron] // 0
var myInventory: Inventory<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myInventory[.iron] // 4
myInventory.remove(.iron) // 3
myInventory.remove(.dwarvish) // 0
myInventory.remove(.magic) // 0



//----------------------------------------------------------------
extension Inventory {
    mutating func insert(element: Element) {
        storage[element] = (storage[element] ?? 0) + 1
    }
    
    mutating func remove(_ element: Element) {
        let count = (storage[element] ?? 0)
        if count > 0 {
            storage[element] = count - 1
        }
    }
}
extension Inventory {
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
}
extension Inventory {
    var count: Int? {
        if storage.count == 0 {
            return nil
        }
        return storage.count
    }
}
extension Inventory: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    init(arrayLiteral elements: Element...) {
        for element in elements {
            storage[element] = (storage[element] ?? 0) + 1
        }
    }
}
