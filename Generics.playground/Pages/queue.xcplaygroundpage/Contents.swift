//: [Previous](@previous)

import Foundation

//: Queue - a first in first out structure

struct NumberQueue {
    private(set) var elements: [Int]
    
    mutating func push(_ element: Int) {
        elements.append(element)
    }
    
    mutating func pop() -> Int {
        return elements.removeFirst()
    }
}

var deliNumbers = NumberQueue(elements: [55, 56, 57])
deliNumbers.push(58)
deliNumbers
deliNumbers.pop()

//: ## Convert to Generics

struct Queue<T> {
    private (set) var elements: [T]
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        if elements.count > 0 {
            return elements.removeFirst()
        } else {
            return nil
        }
    }
    
    func peek() -> T? {
        return elements.first
    }
}
    
    var checkoutLine = Queue(elements: ["John", "Liz"])
    checkoutLine.elements
    
    checkoutLine.push("Dan")
    checkoutLine.elements
checkoutLine.pop()
    



//: [Next](@next)
