import UIKit
import Foundation


struct CountedSet<Value: Hashable> {
    var dictionary: [Value: Int] = [:]
    
    mutating func insert(valueForDictionary: Value){
        dictionary[valueForDictionary] = (dictionary[valueForDictionary] ?? 0) + 1
        
    }
    
    mutating func remove(valueForDictionary: Value){
        let count = dictionary[valueForDictionary] ?? 0
        
        if count > 0 {
            dictionary[valueForDictionary] = count - 1
        }
    }
    
    subscript(_ member: Value)-> Int {
        return dictionary[member] ?? 0
    }

}

extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Value
    
    init(arrayLiteral elements: Value...) {
        for element in elements {
            self.insert(valueForDictionary: element)
        }
    }
    
    
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(valueForDictionary: .iron) // 3
myCountedSet.remove(valueForDictionary: .dwarvish) // 0
myCountedSet.remove(valueForDictionary: .magic) // 0


