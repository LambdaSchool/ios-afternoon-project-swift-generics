import Cocoa

struct CountedSet<Element> : ExpressibleByArrayLiteral where Element: Hashable  {
    
    private(set) var dictionary: [Int: Element] = [:]
    
        init(arrayLiteral elements: Element...) {
            print("ok it's initialized")
            for element in elements {
                insert(element: element)
                print(element)
                print(elements.count)
            }
    }
    
    mutating func insert(element: Element) {
        dictionary[dictionary.count] = element
        print(dictionary.count)
    }
    
    func remove(element: Element) {
        if dictionary.values.contains(element) {
            
        }
    }
    
    subscript(_ element: Element) -> Int {
    //    print("DICTIONARY ELEMENTS: \(dictionary)")
        if dictionary.values.contains(element) {
            print("ok so theres an element")
            var count = 0
            for (_, value) in dictionary {
                if value == element {
                    count += 1
                }
            }
            return count } else {
            print("theres no element")
            return 0
        }
        
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
//myCountedSet.remove(.iron) // 3
//myCountedSet.remove(.dwarvish) // 0
//myCountedSet.remove(.magic) // 0

