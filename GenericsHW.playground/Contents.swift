import Foundation


// generic CountedSet Struct Confomr to hashabe
struct CountedSet<Element: Hashable> {
   
    //Private dictionary  for members and counts
    private var dictionary: [Element: Int] = [:]
    
    // unique elements in counted set
    var count: Int {
        return dictionary.count
    }
    
    // when count of unique = 0
    var isEmpty: Bool {
        return count == 0
        
    }
    
    // inset 1 element at a time
    mutating func insert(_ item: Element) {
        if dictionary.keys.contains(item) {
            if let number = dictionary[item] {
                dictionary[item] = number + 1
            }
        } else {
        dictionary[item] = 1
        }
    }
    
    //remove 1 elememnt at a time
    mutating func remove(_ item: Element) {
    if let quantity = dictionary[item],
        quantity > 1 {
        dictionary[item] = quantity - 1
        }
    else {
        dictionary.removeValue(forKey: item)
        }
    }

    // subscipting to check values
    subscript(_ member: Element) -> Int {
        if let quantity = dictionary[member] {
            return quantity
        } else {
            return 0
        }
    }
}

//extension CountedSet: ExpressibleByArrayLiteral {
//    typealias ArrayLiteralElement =
//
//
//}
