import UIKit


// Creates generic CountedSet struct that is contrained to Hashable elements
struct CountedSet<Element: Hashable> {
    
    //Private dict property for backing storage for set members and their counts
    private var dict: [Element: Int] = [:]
    
    // number of unique elements in the counted set
    var count: Int {
        return dict.count
    }
    // property for when when count of unique elements is zero
    var isEmpty: Bool {
        return count == 0
    }
    
    //Inserts one element at a time
    mutating func insert(_ item: Element) {
        if dict.keys.contains(item) {
            if let number = dict[item] {
                dict[item] = number + 1
            }
        } else {
            dict[item] = 1
        }
    }

    // Removes one element at a time
    mutating func remove(_ item: Element) {

        if let quantity = dict[item],
            quantity > 1 {
            dict[item] = quantity - 1
        } else {
            dict.removeValue(forKey: item)
        }
    }

    func contains(_ item: Element) -> Bool {
        return dict.keys.contains(item)
    }

    //subscripting to lookup current values
    subscript(_ member: Element) -> Int {
        if let quantity = dict[member] {
            return quantity
        } else {
            return 0
        }
    }
}

// MARK:- Extension
// Initializes a counted set using an array of same-type items
extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element

    init(arrayLiteral elements: Element...) {
        for element in elements {
            self.insert(element)
        }
    }
}

// MARK:- enum for supported interaction
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0

