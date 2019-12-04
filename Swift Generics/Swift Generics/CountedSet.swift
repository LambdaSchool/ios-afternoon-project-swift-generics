//
//  CountedSet.swift
//  Swift Generics
//
//  Created by Dennis Rudolph on 12/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

struct CountedSet<Element: Hashable> {
    
    var countedSet: [Element:Int] = [:]
    
    mutating func insert(key: Element) -> Int {
        if countedSet.keys.contains(key) {
            if let validNumber = countedSet[key] {
                countedSet[key] = validNumber + 1
                return countedSet[key] ?? 0
            } else {
                return 0
            }
        } else {
            countedSet[key] = 1
            return 1
        }
    }
    
    mutating func delete(key: Element) -> Int {
        if countedSet.keys.contains(key), countedSet[key] != 0, let validNumber = countedSet[key]  {
            countedSet[key] = validNumber - 1
            return countedSet[key] ?? 0
        } else {
            return 0
        }
    }
    
    subscript(_ member: Element) -> Int {
        return countedSet[member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
 
    init(arrayLiteral elements: Element...) {
        for element in elements {
            _ = self.insert(key: element)
        }
    }
}
