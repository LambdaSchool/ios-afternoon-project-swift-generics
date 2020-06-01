import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var elements: [Element: Int] = [:]
    
    mutating func insert(_ member: Element) {
        
        elements[member, default: 0] += 1
    }
    
    mutating func remove(_ member: Element) -> Element? {
        guard var count = elements[member], count > 0 else { return nil }
        count -= 1
        elements[member] = count == 0 ? nil : count
        return member
        
    }
    subscript(_ member: Element) -> Int { //used to more easily access the elements within the array or object
        return elements [member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral, CustomStringConvertible {
    typealias  ArrayLiteralElement = Element
    init<S: Sequence>(_ sequence: S) where S.Element == Element {
        self.elements = sequence.reduce(into: [:]) { $0[$1, default: 0] += 1}
    }
    init(arrayLiteral elements: Element...) { self.init (elements) }
    var description: String {.init(describing: elements)
    }
}

var countSet = CountedSet<Int>()
countSet.insert(3)
countSet.insert(4)
countSet.insert(4)
countSet.insert(3)
countSet.insert(3)

countSet.remove(4)
countSet.elements
countSet.insert(4)


var countedSet: CountedSet = [1,2,2,3,3,3,4,4,5,5,5]
print(countedSet)
