import UIKit
import Foundation


struct CountedSet<Element: Hashable> {
    
    typealias DictionaryType = [Element : Int]
    private var privateDictionary = DictionaryType()
    
    func currentCount(_ element: Element) -> Int {
        return privateDictionary[element] ?? 0
    }
    
    mutating func insert(_ element: Element) {
        if currentCount(element) == 0 {
            privateDictionary[element] = 1
        } else {
            let newCount = currentCount(element) + 1
            privateDictionary[element] = newCount
        }
    }
}

var testRun = CountedSet<Int>()
testRun.insert(44)
print(testRun)
testRun.insert(44)
print(testRun)
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var newTest = CountedSet<Arrow>()
testRun[44]




extension CountedSet: Collection {
    // Required nested types, that tell Swift what our collection contains
    typealias Index = DictionaryType.Index
    typealias Element = DictionaryType.Element

    // The upper and lower bounds of the collection, used in iterations
    var startIndex: Index { return privateDictionary.startIndex }
    var endIndex: Index { return privateDictionary.endIndex }

    // Required subscript, based on a dictionary index
    subscript(index: Index) -> Iterator.Element {
        get { return privateDictionary[index] }
    }

    // Method that returns the next index when iterating
    func index(after i: Index) -> Index {
        return privateDictionary.index(after: i)
    }
}

extension CountedSet: ExpressibleByDictionaryLiteral {
//    typealias Key = Element
//    typealias Value = Int

    init(dictionaryLiteral elements: (Element, Int)...) {
        for (element, count) in elements {
            privateDictionary[element] = count
        }
    }
}
