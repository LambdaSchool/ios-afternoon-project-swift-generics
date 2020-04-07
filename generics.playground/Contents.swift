import Cocoa

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Self
    
    private(set) var storageDict: [Int : Element] = [:]
    var count: Int = 0
    var isEmpty: Bool = true
    
    func insert(_ element: Element) {
        
    }
    
    func remove(_ element: Element) {
        
    }
    
    func subscript(_ member: Element) -> Int {
        
    }
    
}
