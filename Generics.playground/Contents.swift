import Foundation

struct CountedSet<Element: Hashable>{
    private var myDictionary = [Element : Int]()
    
    var count: Int{
        return myDictionary.count
    }
    
    var isEmpty: Bool{
        return count == 0
    }
    
    
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element: element)
        }
    }
}



