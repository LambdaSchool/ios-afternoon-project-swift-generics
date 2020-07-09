import Foundation

enum Arrow {
    case ancientNord, daedric, dragonbone, dwarven, ebony, elven, forsworn, glass, iron, nordic, orcish, steel
}

struct CountedSet<Element: Hashable> {
    
    private(set) var storage = [Element : Int]()
    
    mutating func insert(item: Element) {
        storage[item] = (storage[item] ?? 0) + 1
    }
    
    mutating func remove(item: Element) {
        let amount = storage[item] ?? 0
        
        if amount > 0 {
            storage[item] = amount - 1
        }
    }
}

extension CountedSet {
    subscript(_ item: Element) -> Int {
        return storage[item] ?? 0
    }
    
    var count: Int {
        return storage.count
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            storage[element] = (storage[element] ?? 0) + 1
        }
    }
}

var firstCountedSet = CountedSet<Arrow>()
firstCountedSet.insert(item: .iron)
firstCountedSet.insert(item: .iron)
firstCountedSet.insert(item: .iron)
firstCountedSet.insert(item: .forsworn)
firstCountedSet.insert(item: .glass)
firstCountedSet[.iron]
firstCountedSet.count

var secondCountedSet: CountedSet<Arrow> = [.daedric, .daedric, .dragonbone, .orcish, .elven]
secondCountedSet.storage
secondCountedSet.count
secondCountedSet.remove(item: .orcish)
secondCountedSet[.orcish]

