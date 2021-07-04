import Foundation

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            insert(element)
        }
    }
}



struct CountedSet<Element: Hashable>: Equatable {

    mutating func insert(_ element: Element) {
        elements[element, default: 0] += 1
    }

    mutating func remove(_ element: Element) {
        if let count = elements[element] {
            if count > 1 {
                elements[element] = count - 1
            } else {
                elements.removeValue(forKey: element)
            }
        }
    }

    func intersection(with countedSet: CountedSet) -> CountedSet {
        var newCountedSet = self
        for element in countedSet.elements {
            if let originalElement = elements[element.key] {
                let count = originalElement + element.value
                newCountedSet.insert(element.key)
                newCountedSet[element.key] = count
            } else {
                newCountedSet.insert(element.key)
                newCountedSet.elements[element.key] = element.value
            }
        }
        return newCountedSet
    }

    func subtract(_ countedSet: CountedSet) -> CountedSet {
        var newCountedSet = self
        for element in countedSet.elements {
            if let originalElement = elements[element.key] {
                let count = originalElement.hashValue - element.value
                if count > 0 {
                    newCountedSet[element.key] = count
                } else {
                    newCountedSet.remove(element.key)
                }

            }
        }
        return newCountedSet
    }

     func contains(_ element: Element) -> Bool {
        guard let element = elements[element] else { return false }
        if element > 0 {
            return true
        } else {
            return false
        }
    }

    subscript(_ member: Element) -> Int {
        get {
            return elements[member, default: 0]
        }
        set {
            if newValue <= 0 {
                remove(member)
            }
            elements[member] = newValue
        }
    }


    var count: Int {
        if elements.isEmpty {
            return 0
        } else {
            return elements.count
        }
    }

    private var elements: [Element: Int] = [:]
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet.insert(.dwarvish)
aCountedSet.insert(.magic)
print(aCountedSet)
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
print(myCountedSet[.iron])
myCountedSet.remove(.iron)
myCountedSet.remove(.magic)
myCountedSet.insert(.magic)
myCountedSet.insert(.magic)
myCountedSet.insert(.magic)
print(myCountedSet[.magic])
print(myCountedSet.count)
print(myCountedSet.contains(.dwarvish))
print(myCountedSet.contains(.magic))

let union = aCountedSet.intersection(with: myCountedSet)
let subtraction = myCountedSet.subtract(aCountedSet)

print(aCountedSet)
print("")
print(myCountedSet)
print("")
print(union)
print("")
print(subtraction)


