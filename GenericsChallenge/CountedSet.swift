//
//  CountedSet.swift
//  GenericsChallenge
//
//  Created by Bradley Yin on 9/4/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation

struct CountedSet<Element: Hashable> {
    
    var elements: [Element]
    
//    Add insertion and removal (insert and remove) of one element at a time.
    mutating func insert(_ element: Element) {
        elements.append(element)
    }
    mutating func remove(_ element: Element) {
        if let index = elements.firstIndex(of: element) {
            elements.remove(at: index)
        }
    }
//    Support subscripting to look up current values (by implementing subscript(_ member: Element) -> Int). Return 0 for any value that is not found.
    subscript(_ members: Element) -> Int {
        if let index = elements.firstIndex(of: members) {
            return index
        } else {
            return 0
        }
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
