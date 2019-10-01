//: [Previous](@previous)

import UIKit

//: ## Swap function

print ("X = \(x), y = \(y)")

var x = 5
var y = 10

print ("Before: X = \(x), y = \(y)")

swap(&x, &y)

print ("After: X = \(x), y = \(y)")


//: Make function generic

var firstRunner = "Dave"
var secondRunner = "Pat"

func swap<Value> (_ lhs: inout Value, _ rhs: inout Value) {
    let temp = lhs
    lhs = rhs
    rhs = temp
}

swap(&firstRunner, &secondRunner)

infix operator <=>

func <=> <T>(lhs: inout T, rhs: inout T) {
    let temp = lhs
    lhs = rhs
    rhs = temp
}

var speedLimit = 25
var yourSpeed = 50

speedLimit <=> yourSpeed
speedLimit
yourSpeed

//: [Next](@next)
