import UIKit

struct CountedSet<Value>: Hashable {
    
    private(set) var 
    
    func insert() {
        
    }
    
    func remove() {
        
    }
    
}


enum Arrow {
    case iron
    case wooden
    case elven
    case dwarvish
    case magic
    case silver
}

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
