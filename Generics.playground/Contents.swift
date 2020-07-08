import Foundation

struct CountedSet<Element: Hashable>{
    //MARK: - Properties
    private var myDictionary = [Element : Int]()
    var count: Int{
        return myDictionary.count
    }
    var isEmpty: Bool{
        return count == 0
    }
    
    //MARK: - Functions
    mutating func insert(element: Element){
    
    }
    
    mutating func remove(element: Element){
        
    }
    
    subscript(_ member: Element) -> Int{
        return myDictionary[member] ?? 0
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



