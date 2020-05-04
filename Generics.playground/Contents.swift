import UIKit

//CountedSet Holds a dictionary with ways to modify it
struct CountedSet <Element: Hashable, Sequence> {
    
    //Key - Member, Value - Members Count
    private(set) var dictionary: [Element: Int]
    
    //Inserting into dictionary
    mutating func insert(key: Element, value: Int) {
        dictionary[key] = value
    }
    
    //Removing From dictionary
    mutating func remove(key: Element) {
        dictionary[key] = nil
    }
    
    //Number of elements in the dictionary
    func count() -> Int {
        var amount: Int = 0
        
        for i in dictionary {
            amount += 1
        }
        return amount
    }
    
    //Allows us to call countedSet directly
    //Then Execute Subscript
    subscript(_ member: Element) -> Int {
        if let result = dictionary[member] {
            return result
        } else {
            return 0
        }
    }
}


//MARK: - Properties
var countedSet = CountedSet(dictionary: ["Cameron" : 1, "Sadie": 2, "Bill" : 3])
countedSet.dictionary


//MARK: - Method Calls
countedSet.remove(key: "Bill")
countedSet.insert(key: "Orion", value: 5)
countedSet.count()

//Subscript Call
countedSet["Cam"]
countedSet["Orion"]



//MARK: - Extension
/*extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element) {
        self.init()
        for element in arrayLiteral {
            self.insert(key: element, value: 1)
        }
    }
}*/




