import Cocoa




struct CountedSet<Element:Hashable>: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        //
    }
    typealias ArrayLiteralElement = Element
    
    
    private(set) var storage: [Element : Int] = [:]
    
    func insert() {
        
    }
    
    func remove() {
        
    }
    
    func count() {
    
    }
    
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
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
