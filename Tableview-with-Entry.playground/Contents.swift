import UIKit

struct CountedSet <T: Hashable> {
    private(set) var dictionary: [T: Int] = [:]
    
    var count: Int {
        dictionary.count
    }
    var isEmoty: Bool {
        return count == 0
    }
    
    
    
    mutating func insert(_ element: T) {
        if var _ = dictionary[element] {
            dictionary[element]! += 1
        } else {
            dictionary[element] = 1
        }
    }
    
    mutating func remove(_ element: T) -> Int {
        if var _ = dictionary[element] {
            dictionary[element]! -= 1
        } else {
            dictionary[element]
        }
        return dictionary[element] ?? 0
    }
}
