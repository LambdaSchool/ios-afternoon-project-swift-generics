import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var memberDict: [Element: Int] = [:]
    
    mutating func insert(_ member: Element, occurrences: Int = 1) -> Int {
        if occurrences > 0 {
            if let count = memberDict[member] {
                memberDict[member] = count + occurrences
                return count + occurrences
            } else {
                memberDict[member] = occurrences
                return occurrences
            }
        }
        else { return 0 }
    }
    
    mutating func remove(_ member: Element, occurrences: Int = 1) -> Int {
        if let count = memberDict[member],
            count >= occurrences {
            if count > occurrences {
                memberDict[member] = count - occurrences
                return count - occurrences
            } else {
                memberDict[member] = nil
                return 0
            }
        } else {
            return 0
        }
    }
    
    subscript(_ member: Element) -> Int {
        get {
            if let count = memberDict[member] {
                return count
            } else {
                return 0
            }
        }
    }
    
    var count: Int {
        return memberDict.count
    }
    var isEmpty: Bool {
        return memberDict.isEmpty
    }

}

var animals = CountedSet(memberDict: ["dog": 1])
animals.insert("cat")
animals.insert("rabbit")
animals.insert("dog")
animals.insert("cat")
animals.remove("rabbit")
animals.remove("dog")
animals.count
animals["dog"]
animals["cat"]
animals["rabbit"]


extension CountedSet: ExpressibleByArrayLiteral {

    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            insert(element)
        }
    }
    
    init<S: Sequence>(_ sequence: S) where
      S.Iterator.Element == Element {
      for element in sequence {
        insert(element)
      }
    }

    init<S: Sequence>(_ sequence: S) where
      S.Iterator.Element == (key: Element, value: Int) {
      for (element, count) in sequence {
        insert(element, occurrences: count)
      }
    }
    
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0


var instruments = ["Saxophone", "Trumpet", "Piano", "Clarinet", "Violin", "Guitar", "Drum"]
var jacobsonInstruments = CountedSet(instruments)
jacobsonInstruments.insert("Saxophone")
jacobsonInstruments.insert("Saxophone")
jacobsonInstruments.insert("Saxophone")
jacobsonInstruments.insert("Saxophone")
jacobsonInstruments.insert("Saxophone")
jacobsonInstruments.insert("Clarinet")
jacobsonInstruments.count
jacobsonInstruments["Saxophone"]

var livestock = ["goat": 4, "pig": 2, "chicken": 20]
var barn = CountedSet(livestock)
barn["pig"]
