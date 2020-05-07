import UIKit
import Foundation


struct CountedSet<Value: Hashable> {
    var dictionary: [Value: Int] = [:]
    
    mutating func insert(valueForDictionary: Value){
        dictionary[valueForDictionary]! += 1
        
    }
    
    mutating func remove(valueForDictionary: Value){
        dictionary[valueForDictionary]! -= 1
    }
    
    subscript(_ member: Value)-> Int {
        var count = 0
        for (keys, values) in dictionary {
            if dictionary[keys] == values {
                count = count + 1
                
            } else {
                return count
            }
        }
        
        return count
        
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


