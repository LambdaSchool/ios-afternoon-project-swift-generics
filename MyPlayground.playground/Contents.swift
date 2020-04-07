import Cocoa

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
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
    
    // MARK: - ExpressibleByArrayLiteral
    
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: Element...) {
        self.init()
        for element in elements {
            memCount[element] = 0
        }
    }
}
