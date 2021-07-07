//
//  CountedSet.swift
//  GenericsChallenge
//
//  Created by Bradley Yin on 9/4/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation

struct CountedSet<Element: Hashable> {
    
    var elements: [Element] = []
//    Add insertion and removal (insert and remove) of one element at a time.
    mutating func insert(_ element: Element) {
        elements.append(element)
    }
    mutating func remove(_ element: Element) -> Int {
        var duplicateCount = 0
        var alreadyHave = false
        var tempElements: [Element] = []
        for item in elements {
            if item == element && !alreadyHave {
                alreadyHave = true
                tempElements.append(item)
            } else if item == element && alreadyHave {
                duplicateCount += 1
            } else {
                tempElements.append(item)
            }
            
        }
        elements = tempElements
        return duplicateCount
    }
//    Support subscripting to look up current values (by implementing subscript(_ member: Element) -> Int). Return 0 for any value that is not found.
    subscript(_ members: Element) -> Int {
        var numOfElement = 0
        for element in elements {
            if element == members {
                numOfElement += 1
            }
        }
        return numOfElement
    }
//    Add count, returning the number of unique elements in the counted set and isEmpty for when count is zero.
    func count() -> String {
       let set = removeDuplicates(array: elements)
        if set.count > 0 {
            return "\(set.count)"
        } else {
            return "isEmpty"
        }
    }
    
    func removeDuplicates<Element: Equatable>(array: [Element]) -> [Element] {
        var result: [Element] = []
        
        for item in array {
            if !result.contains(item) {
                result.append(item)
            }
        }
        return result
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: CountedSet.ArrayLiteralElement...) {
        self.init()
        for element in elements {
            self.elements.append(element)
        }
    }
    
    
}
