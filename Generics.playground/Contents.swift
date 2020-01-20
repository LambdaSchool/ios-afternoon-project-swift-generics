import UIKit
import Foundation

// create the struct for CountedSet
    // in struct, use a dictionary with the key equal to the element and the value equal to the number of occurrences
// create methods for the insert and remove properties
// conform struck to Collection protocol to support subscripting "subscript(_member: Element) -> Int)
// create extension for expressibleByArrayLiteral and initialize


struct CountedSet<Element: Hashable> : Equatable {
    typealias DictionaryType = [Element : Int]

    private var myCountedSet = DictionaryType()

    init(myCountedSet: DictionaryType) {
        self.myCountedSet = myCountedSet
    }
    func insert(_ element: Element) {
        if myCountedSet.
    }
    
    func countElement(element: Element) -> Int {
        return myCountedSet[element] ?? 0
    }
}
extension CountedSet: Collection {
    // Required nested types, that tell Swift what our collection contains
    typealias Index = DictionaryType.Index
    typealias Element = DictionaryType.Element

    // The upper and lower bounds of the collection, used in iterations
    var startIndex: Index { return myCountedSet.startIndex }
    var endIndex: Index { return myCountedSet.endIndex }

    // Required subscript, based on a dictionary index
    subscript(index: Index) -> Iterator.Element {
        get { return myCountedSet[index] }
    }

    // Method that returns the next index when iterating
    func index(after i: Index) -> Index {
        return myCountedSet.index(after: i)
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.append(element)
        }
    }
}

