import Cocoa

struct CountedSet<Element> : ExpressibleByArrayLiteral where Element: Hashable  {
    
    private(set) var dictionary: [Int: Element] = [:]
    
        init(arrayLiteral elements: Element...) {
            
            print("SOMETHING HAPPENS")
            print(elements.count)
            for element in elements {
                print(element)
            //    dictionary[element.hashValue : element]
            }
            
    }
}









enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
//aCountedSet[.iron] // 0
//var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
//myCountedSet[.iron] // 4
//myCountedSet.remove(.iron) // 3
//myCountedSet.remove(.dwarvish) // 0
//myCountedSet.remove(.magic) // 0
