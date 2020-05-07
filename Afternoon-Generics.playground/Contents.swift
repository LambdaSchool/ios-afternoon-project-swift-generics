import Foundation

struct CountedSet <T: Hashable>  {
    
    private(set) var dictionary: [T: Int] = [:]
    
    var count: Int {
        dictionary.count
    }
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func insert(_ element: T) -> Int {
        dictionary.append(element)
    }
    
    mutating func remove() {
        dictionary.removeLast()!
    }
    
    subscript(_ member: T) -> Int {
        
    }
}

extension CountedSet: ExpressibleByArrayLiteral {

    init(arrayLiteral:T...) {
           self.init()
    }
}
