import UIKit

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.init()
        
    }
    
    typealias ArrayLiteralElement = Element
    
    

    
    
}


