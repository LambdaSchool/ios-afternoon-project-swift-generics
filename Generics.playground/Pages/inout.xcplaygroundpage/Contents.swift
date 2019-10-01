//: [Previous](@previous)

import Foundation

//: ## Create an increment function() function

var x = 0

func increment(number: inout Int) {
    number += 1
}

increment(number: &x)
x


//: [Next](@next)
