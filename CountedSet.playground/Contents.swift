import UIKit
import Foundation

struct CountetSet<Element> where Element: Hashable {
 
    
    private(set) var elements = Set<Element>()
    
    mutating func insert(element: Element) {
        elements.insert(element)
    }
    
    mutating func remove() -> Element? {
        guard elements.isEmpty == false else { return nil }
        return elements.popFirst()
    }
    
    func subcript(_ member: Element) -> Int {
        if !elements.contains(member) {
            print("Not contain.")
            return 0
        } else {
            let index = elements.distance(from: elements.firstIndex(of: elements.first!)!, to: elements.firstIndex(of: member)!)
            print("Contain ,position \(index).")
              return index
        }
    }
    
    func count() -> Int {
        return Set(elements).count
    }
    
    
    func isEmpty() -> Bool {
        return elements.count == 0
    }
    
    

}

let test = CountetSet(elements: [2,6,7,77,7])
let test2 = CountetSet(elements: ["Nick"])

print(test2)
test2.subcript("Nick")
test2.subcript("Nancy")

//extension CountetSet : ExpressibleByArrayLiteral {
//    required init(arrayLiteral elements: Self.ArrayLiteralElement) {
//        <#statements#>
//    }
//
//}
