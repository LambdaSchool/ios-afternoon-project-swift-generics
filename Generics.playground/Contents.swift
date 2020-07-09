import Foundation

struct CountedSet <Element: Hashable> {

    private var setDict: Dictionary<Element, Int> = [ : ]

    var countValue: String {
        if setDict.count == 0 {
            return "isEmpty"
        } else {
            return ("\(setDict.count)")
        }
    }

    subscript(_ member: Element) -> Int {
        if let int = setDict[member] {
            return int
        } else {
            return 0
        }
    }

    func contains(_ element: Element) -> Bool {
        return setDict.keys.contains(element)
    }

    mutating func insert(_ element: Element) -> Int {
        if setDict.keys.contains(element) {
            if let int = setDict[element] {
                setDict[element] = int + 1
            }
        } else {
            setDict[element] = 1
        }
        guard let int = setDict[element] else { return 0}
        return int
    }

    mutating func remove(_ element: Element) -> Int {
        if let int = setDict[element],
            int > 1 {
            setDict[element] = int - 1
        } else {
            setDict.removeValue(forKey: element)
        }
        guard let int = setDict[element] else { return 0}
        return int
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
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
myCountedSet.countValue
myCountedSet.contains(.iron)

var myIntSet: CountedSet<Int> = [1,2,3,4,5,1,1,2,2,2]
myIntSet.countValue
myIntSet.insert(5)
myIntSet.remove(1)
myIntSet.countValue
myIntSet[2]

var myOtherIntSet: CountedSet<Int> = [1]
myOtherIntSet.remove(1)
myOtherIntSet.countValue





