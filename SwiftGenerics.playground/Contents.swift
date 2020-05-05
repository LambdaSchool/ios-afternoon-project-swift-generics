import UIKit


struct CountedSet<Element: Hashable> {
    private(set) var dict: [Element: Int] = [:]
    
    mutating func insert(_ element: Element) {
        if let count = dict[element] {
            dict[element] = count + 1
        } else {
            dict[element] = 1
        }
    }
}



//enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
//var aCountedSet = CountedSet<Arrow>()
//aCountedSet[.iron] // 0
//var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
//myCountedSet[.iron] // 4
//myCountedSet.remove(.iron) // 3
//myCountedSet.remove(.dwarvish) // 0
//myCountedSet.remove(.magic) // 0
