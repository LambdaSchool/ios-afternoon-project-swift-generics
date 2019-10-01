//: [Previous](@previous)

import Foundation

func power(_ value: Int, _ exponent: Int) -> Int {
    var result: Int = 1
    for _ in 0..<exponent {
        result *= value
    }
    return result
}

let result = power(2, 8)


func power<T: Numeric>(_ value: T, _ exponent: Int) -> T {
    var result: T = 1
    for _ in 0..<exponent {
        result *= value
    }
    return result
}

let value = power(3.5,3)

extension Numeric {
    //does not modify self
    func raisedTo(_ exponent: Int) -> Self {
        var result: Self = 1
        for _ in 0..<exponent {
            result *= self
        }
        return result
    }
    //changes self
    mutating func raiseTo(_ exponent: Int) {
        var result: Self = 1
        for _ in 0..<exponent {
            result *= self
        }
        self = result
    }
}

var number = 10
number.raisedTo(2)
number.raiseTo(2)

infix operator **

func ** <T: Numeric>(_ value: T, exponent: Int) -> T {
    var result: T = 1
    for _ in 0..<exponent {
        result *= value
    }
    return result
}

4 ** 2

//: [Next](@next)
