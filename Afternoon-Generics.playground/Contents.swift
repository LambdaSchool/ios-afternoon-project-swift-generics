import Foundation

struct CountedSet <T: Hashable>  {
    
    private(set) var dictionary: [T: Int] = [:]
    
    var count: Int {
        dictionary.count
    }
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func insert(_ element: T) {
        if let index = dictionary.index(forKey: element) {
            if let elementCount = dictionary[element] {
                elementCount + 1
            } else {
                dictionary[element] = 1
            }
        }
    }
    
    mutating func remove(_ element: T) -> Int {
        if let index = dictionary.index(forKey: element) {
            if let elementCount = dictionary[element] {
                elementCount - 1
            } else {
                dictionary[element] = 1
            }
        }
        return dictionary[element] ?? 0
    }
    
    subscript(_ element: T) -> Int {
        if let index = dictionary.index(forKey: element) {
            return dictionary[index].value
        } else {
            return 0
            
        }
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    
    init(arrayLiteral element: T...) {
        self.init()
        for element in element {
            self.insert(element)
        }
    }
}
