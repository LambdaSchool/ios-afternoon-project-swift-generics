
import Foundation

let stringArray = ["1", "2", "3", "4", "5", "6", "7", "1", "6", "8", "3", "5", "9", "3", "2"]


struct CountedSet<Element: Hashable> {
    private (set) var elements: [Element]

    mutating func insert(_ element: Element, x: Int) {
        elements.insert(element, at: x)
    }
    mutating func count() -> Int {

        return elements.count
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.append(element)
        }
    }
}

var returnSet = CountedSet(elements: stringArray)
returnSet.insert("dog", x: 2)
returnSet.count()
