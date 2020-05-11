import Foundation

struct CountedSet<Element: Hashable> {
    
    var dictionary: [Element : Int] = [:]
    
    mutating func insert(obj: Element) {
        if let objIndex = dictionary.first(where: { $0.key == obj }) {
            let value = objIndex.value
            dictionary.updateValue(value + 1,
                                   forKey: objIndex.key)
        } else {
            dictionary[obj] = 1
        }
    }
    
    mutating func remove(obj: Element) {
        if let obj = dictionary.first(where: { $0.key == obj }) {
            if obj.value == 1 {
                if let objIndex = dictionary.firstIndex(where: { $0.key == obj.key }) {
                    dictionary.remove(at: objIndex)
                }
            } else {
                let value = obj.value
                dictionary.updateValue(value - 1,
                                       forKey: obj.key)
            }
        } else {
            print("Object not found")
        }
    }
    
    subscript(_ obj: Element) -> Int {
        return dictionary[obj] ?? 0
    }
    
    func count() -> Int? {
        return dictionary.count
    }
    
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(obj: element)
        }
    }
}



var mySet = CountedSet<String>()

mySet.insert(obj: "Thomas")
mySet.insert(obj: "Thomas")
mySet.insert(obj: " Dye")

print(mySet.dictionary)
print(mySet.dictionary["Thomas"]!)
print(mySet.count()!)

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, // 1
                                       .magic, // 1
                                       .iron, // 2
                                       .silver, // 1
                                       .iron, // 3
                                       .iron] // 4
myCountedSet[.iron] // 4
myCountedSet.remove(obj: .iron) // 3
myCountedSet.remove(obj: .dwarvish) // 0
myCountedSet.remove(obj: .magic) // 0
