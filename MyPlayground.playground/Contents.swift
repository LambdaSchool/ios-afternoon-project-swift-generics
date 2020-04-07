import Cocoa

struct CountedSet<Element: Hashable> {
    
    private var memCount: [Element : Int]
    var isEmpty: Bool {
        if memCount.count == 0 {
            return true
        }
        return false
    }
    var count: Int {
        return memCount.count
    }
    
    mutating func insert(member: Element) {
        if memCount[member] == nil {
            memCount[member] = 1
        } else {
            memCount[member]! += 1
        }
    }
    
    mutating func remove(_ member: Element) {
        if memCount[member] == nil {
            memCount[member] = 1
        } else {
            memCount[member]! -= 1
        }
    }
    
    subscript(_ member: Element) -> Int {
        get {
            return memCount[member] ?? 0
        }
        set(newValue) {
            insert(member: member)
        }
    }
    
    
}

extension CountedSet: ExpressibleByArrayLiteral {
    // MARK: - ExpressibleByArrayLiteral
    
    init(arrayLiteral elements: Element...) {
        self.init()
        for element in elements {
            insert(member: element)
        }
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
