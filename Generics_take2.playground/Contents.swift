import UIKit
import Foundation


struct CountedSet<Element: Hashable> {
    typealias DictionaryType = [Element : Int]

    // Underlying, private storage, that is the same type of dictionary
    // that we previously was using at the call site
    private var myCountedSet = DictionaryType()

    // Enable our collection to be initialized with a dictionary
    init(myCountedSet: DictionaryType) {
        self.myCountedSet = myCountedSet
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

extension CountedSet: ExpressibleByDictionaryLiteral {
    typealias Key = Element
    typealias Value = Int

    init(dictionaryLiteral elements: (Element, Int)...) {
        for (element, count) in elements {
            myCountedSet[element] = count
        }
    }
}
