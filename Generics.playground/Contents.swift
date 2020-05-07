import Foundation

struct CountedSet<Element: Hashable> {
    var set: Set<Element> = []
    
    private var dictionary: [Int:Element] = [:]
    
    mutating func insert(obj: Element) {
        set.insert(obj)
    }
    
    mutating func remove(obj: Element) {
        set.remove(obj)
    }
    
}

var mySet = CountedSet<String>()
mySet.insert(obj: "Hey Hey")
print(mySet.set)
mySet.remove(obj: "Hey ey")
print(mySet.set)
