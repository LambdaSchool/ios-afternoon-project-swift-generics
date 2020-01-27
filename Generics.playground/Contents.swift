//import UIKit

struct CountedSet<Element: Hashable> {
    // MARK: Properties
    private (set) var elements: [Element: Int] =  [:]
    
    var count: Int  {
            return elements.count
        }
        
        var isEmpty: Bool {
            return self.count == 0 ? true : false
        }
        
    // MARK: Methods
        mutating func  insert(_ element: Element) {
            elements[element, default: 0] += 1
        }
        
        mutating func remove(_ element: Element) {
            guard let count = elements[element] else { return }
            if count == 1 {
                elements.removeValue(forKey: element)
            } else {
                self.elements[element, default: 0] -= 1
            }
        }
        
        func contains(_ element: Element) -> Bool {
            if let _ = elements[element] {
                return  true
            }
            return false
        }
    
    subscript(_ member: Element) -> Int {
        get {
            return elements[member, default: 0]
        }
        
        set(newValue) {
            elements[member, default: 0] = newValue
        }
    }
    
    }

// MARK: Conform to ExpressibleByArrayLiteral
    extension CountedSet: ExpressibleByArrayLiteral {
        init(arrayLiteral: Element...) {
            self.init()
            for element in arrayLiteral {
                self.insert(element)
            }
        }
    }
    

// MARK: Tests
// Test 1
print("Test 1")
        var array = CountedSet<String>()
        array.insert("String1")
        array.insert("String2")
        array.insert("String2")
        array.insert("String3")
        array.insert("String3")
        array.insert("String3")
        array.insert("String4")
        array.insert("String4")
        array.insert("String4")
        array.insert("String4")
        print(array)

// Test 2
print("Test 2")
        enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
        var myCountedSet = CountedSet<Arrow>()
        myCountedSet[.dwarvish] = 100
        print(myCountedSet[.dwarvish])
        print("myCountedSet.isEmpty = ", myCountedSet.isEmpty)
        myCountedSet = [.iron, .magic, .iron, .silver, .iron, .iron]
        
        myCountedSet.insert(.dwarvish)
        myCountedSet.insert(.dwarvish)
        myCountedSet.insert(.elven)
        myCountedSet.insert(.elven)
        myCountedSet.insert(.silver)
        myCountedSet.insert(.magic)
        
        print("myCountedSet[.iron] = ", myCountedSet[.iron])
        print("myCountedSet.cout = ", myCountedSet.count)
        print("myCountedSet.isEmpty = ", myCountedSet.isEmpty)
    
    // Test 3
print("Test 3")
        enum Arrow2 { case iron, wooden, elven, dwarvish, magic, silver }
        var aCountedSet = CountedSet<Arrow2>()
        
        if aCountedSet[.iron] == 0 { // 0
            print("Subtest 1 Passed")
        
        }
        var anotherCountedSet: CountedSet<Arrow2> = [.iron, .magic, .iron, .silver, .iron, .iron]
        
        if  anotherCountedSet[.iron] == 4 {
            print("Subtest 2 Passed")
        }
        
        anotherCountedSet.remove(.iron) // 3
        if anotherCountedSet[.iron] == 3 {
            print("Subtest 3 Passed")
        }
        
        anotherCountedSet.remove(.dwarvish) // 0
        if anotherCountedSet[.dwarvish] == 0 {
            print("Subtest 4 Passed")
        } else {
            print("Subtest 4 Failed: \n \(anotherCountedSet[.dwarvish]) != 0")
        }
        anotherCountedSet.remove(.magic) // 0
        if anotherCountedSet[.dwarvish] == 0 {
            print("Subtest 5 Passed")
        } else {
            print("Subtest 5 Failed: \n \(anotherCountedSet[.dwarvish]) != 0")
        }
    
// Test 4
print("Test 4")
        var set = CountedSet<String>()
        set.insert("String")
        set.insert("String1")
        set.insert("String2")
        set.insert("String3")
        set.insert("String3")
        set.insert("String4")
        set["String4"] = 10
        print("set[String4] == ",set["String4"])
        let test = set.contains("String4") == true
        print(test)






