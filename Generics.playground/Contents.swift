import UIKit

// need to take a set of elements hold them in a dictionary in memory that keeps track of how many of each element in the set that we have

struct CountedSet<Element: Hashable> {
    
    private (set) var elements: [Element: Int] = [:]
    
    mutating func insert(_ element: Element, _ count: Int) {
        // add whatever value is inserted to the dictionary and the value of the dictionary is how many times it's there
    }
    
    mutating func remove(_ element: Element) {
        //remove a value from the dictory and change the value of the dictionary to show how many of the element are in the set
        
    }
    
    subscript(_ member: Element) -> Int) {
        // if value is not found Return 0
    }
    

}

// from documentation
//extension CountedSet: ExpressibleByArrayLiteral {
//    init(arrayLiteral: Element...) {
//        self.init()
//        for element in arrayLiteral {
//            self.append(element)
//        }
//    }
//}




