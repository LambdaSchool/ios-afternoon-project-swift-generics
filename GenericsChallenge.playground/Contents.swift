import UIKit

struct CountedSet<Element:Hashable> {
    private(set) var elements = [Element:Int]()
    
    mutating func push(_ element: Element) {
        elements.count
    }
    
    mutating func remove() -> Element {
        if elements.count > 0 {
            return elements.count as! Element
        } else {
            return 0 as! Element
        }
    }
}

enum Arrow {case iron, wooden, elven, dwarvish, magic, silver}

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron]
