//: [Previous](@previous)

import Foundation

let array = [1,2,3,4,5,6,7,8,1,6,8,3,9,5,2]

func removeDups(_ array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for element in array {
        if !newArray.contains(element) { newArray.append(element) }
    }
    return newArray
}

removeDups(array)
//: Alternative using a Set, with generics
func removeDups<T: Hashable>(_ array: [T]) -> [T] {
    let set = Set(array)
    return Array(set)
}

removeDups(array)

//: Make it work for any Sequence, use where clause to add more requirements on the type

func removeDups<S: Sequence>(_ sequence: S) -> [S.Element] where S.Element: Hashable {
    let result: Set<S.Element> = Set(sequence)
    return Array(result)
}

extension Sequence where Element: Hashable{
    func removeDups() -> [Elements] {
        let result = Set(self)
        return Array[result]
    }
}

let uniqueNUmbers = array.removeDups

//: [Next](@next)
