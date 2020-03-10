import Foundation

struct CountedSet<Element: Hashable> {
    
    private var dict: [Element : Int] = [ : ]
    
    var count: Int {
        return dict.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func insert(element: Element) {
        print(dict)
        if let index = dict.index(forKey: element) {
            var count = dict[index].value + 1
            dict.updateValue(count, forKey: element)
        } else {
            dict.updateValue(1, forKey: element)
        }
        print(dict)
    }
    
    mutating func remove(element: Element) {
        print(dict)
        if let index = dict.index(forKey: element) {
            var count = dict[index].value
            count -= 1
            if isEmpty {
                dict.removeValue(forKey: element)
            } else {
                dict.updateValue(count, forKey: element)
            }
        }
        print(dict)
    }
    
    subscript(_ member: Element) -> Int {
        print(dict)
        if let index = dict.index(forKey: member) {
            return dict[index].value
        } else {
            return 0
        }
        print(dict)
    }
    
    func contains(_ item: Element) -> Bool {
        print(dict.keys.contains(item))
        return dict.keys.contains(item)
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            dict[element] = (dict[element] ?? 0) + 1
        }
    }
}

var countedSet = CountedSet<String>()
countedSet.insert(element: "Ufuk")
countedSet.insert(element: "Tobi")
countedSet.insert(element: "Tobi")
countedSet.insert(element: "Jon")
countedSet.insert(element: "Jon")
countedSet.remove(element: "Tobi")

countedSet.contains("ufuk")
