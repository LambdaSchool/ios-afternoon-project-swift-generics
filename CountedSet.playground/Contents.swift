import Foundation

enum Arrow {
    case ancientNord
    case daedric
    case dragonbone
    case dwarven
    case ebony
    case elven
    case forsworn
    case glass
    case iron
    case nordic
    case orcish
    case steel
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

var aCountedSet = CountedSet<Arrow>()
aCountedSet.insert(item: .iron)
aCountedSet[.iron]
aCountedSet[.ancientNord]
aCountedSet.count
aCountedSet.remove(item: .iron)

var anotherCountedSet: CountedSet<Arrow> = [.ancientNord, .ancientNord, .dragonbone, .glass, .forsworn]
anotherCountedSet[.dwarven]
anotherCountedSet[.ancientNord]
anotherCountedSet[.glass]

anotherCountedSet.count

