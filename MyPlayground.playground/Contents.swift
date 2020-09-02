import UIKit

struct CountedSet<Element: Hashable> {
    
    private(set) var dictionary = [Element : Int]()
    

    subscript(_ member: Element) -> Int {
        return 0
    }
    mutating func insert() {
        // check if object exists in dictionary.  If it does increase count and replace existing object
       
    }
  
    
}

extension Array where Element: Hashable {
    
    func countForElements() -> [Element: Int] {
        var counts = [Element: Int]()
        for element in self {
            counts[element] = (counts[element] ?? 0) + 1
        }
        return counts
    }
    
}
//
//
//extension CountedSet where Element: Equatable {
//    mutating func removeElement<Element: Equatable>(element: Element) -> [Element] {
//        for item in items {
//            if items.contains(item) {
//                if let itemIndex = items.firstIndex(of: item) {
//                    items.remove(at: itemIndex)
//                }
//            }
//        }
//        return items as! [Element]
//    }
//}


//extension Sequence where Element: Hashable {
//
//    func removeElement() -> [Element] {
//
//        for item in self {
//            if items.contains(item) {
//                if let itemIndex = result.firstIndex(of: item) {
//                    result.remove(at: itemIndex)
//                }
//            }
//        }
//        return result
//    }
//
//
//
//}


