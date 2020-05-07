import UIKit
import Foundation


struct CountedSet<Element: Hashable> {
    
    typealias DictionaryType = [Element : Int]
    private var privateDictionary = DictionaryType()
    
    func currentCount(_ element: Element) -> Int {
        return privateDictionary[element] ?? 0
    }
    
    subscript(index: Element) -> Int {
        get {
            return privateDictionary[index]!
        }
        set (count) {
            privateDictionary[index]! = count
        }
    }
    
    mutating func insert(_ element: Element) -> Int {
        if currentCount(element) == 0 {
            privateDictionary[element] = 1
        } else {
            let newCount = currentCount(element) + 1
            privateDictionary[element] = newCount
        }
        return currentCount(element)
    }
    
    mutating func remove(_ element: Element) -> Int {
        switch currentCount(element) {
        case 0:
            return 0
        case 1:
            privateDictionary.removeValue(forKey: element)
            return 0
        default:
            let newCount = currentCount(element) - 1
            privateDictionary[element] = newCount
            return newCount
        }
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}


var testRun = CountedSet<Int>()
testRun.insert(44)
print(testRun)
testRun.insert(44)
print(testRun)
testRun.remove(44)
testRun[44] = 4
testRun.remove(44)

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var newTest = CountedSet<Arrow>()

