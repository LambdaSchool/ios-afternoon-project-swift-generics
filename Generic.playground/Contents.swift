import UIKit

var str = "Hello, playground"

struct CountedSet<Element: Hashable> : ExpressibleByArrayLiteral {
    
    private(set) var dic = [Element: Int]()
    var count: Int {
        return dic.count
    }
    
    
    var isEmpty: Bool {
        return count == 0
    }
    
    subscript(_ element: Element) -> Int {
        if let int = dic[element] {
            return int
        } else {
            return 0
        }
    }
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            inset(element)
        }
    }

    typealias ArrayLiteralElement = Element
    
    
    mutating func inset(_ element: Element) {
        dic[element] = (dic[element] ?? 0) + 1
    }
    mutating func remove(_ element: Element) -> Int {
        let int = dic[element] ?? 0
        if int > 0 {
            dic[element] = int - 1
        } else {
            return 0
        }
        return dic[element] ?? 0
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
