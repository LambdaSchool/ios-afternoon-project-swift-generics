import Cocoa

struct CountedSet<Element: Hashable> {
    private var memCount: [Element : Int]
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
    
    mutating func remove(for member: Element) {
        if memCount[member] == nil {
            memCount[member] = 1
        } else {
            memCount[member]! -= 1
        }
    }
    
    subscript(_ member: Element) -> Int {
        return memCount[member] ?? 0
    }
}
