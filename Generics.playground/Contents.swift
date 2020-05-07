import Foundation

struct CountedSet<T:Hashable> {
    private var innerDict = [T:Int]()
    
    func insert(_ ele: T) {
        
    }
    
    func remove(_ ele: T) {
        
    }
    
    subscript(_ member: T) -> Int {
        guard innerDict[member] != nil else { return 0 }
        return innerDict[member]!
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
print(aCountedSet[.iron])
//var myCountedSet: CountedSet<Arrow> = [.iron, .wooden, .magic, .magic]
