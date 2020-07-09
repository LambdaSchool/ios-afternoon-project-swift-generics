//
//  CountedSet.swift
//  Generics
//
//  Created by Waseem Idelbi on 7/8/20.
//  Copyright © 2020 Waseem Idelbi. All rights reserved.
//

import Foundation

struct CountedSet<Element: Hashable> {
    
    //MARK: - Properties -
    
    private var dictionary: [Element : Int] = [:]
    
    //MARK: - Methods -
    
    mutating func insert(_ member: Element) {
        
        guard let _ = dictionary[member] else {
            dictionary[member] = 1
            return
        }
        
        dictionary[member]! += 1
        
    }
    
    mutating func remove(_ member: Element) {
        
        guard let _ = dictionary[member] else {
            print("The item you are trying to remove is already absent")
            return
        }
        
        guard dictionary[member] == 1 else {
            dictionary[member]! -= 1
            return
        }
        
        dictionary.removeValue(forKey: member)
        
    }
    
    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0
    }
    
    func count() -> Int {
        
        return dictionary.count
    }
    
    func isEmpty() -> Bool {
        
        if dictionary.count > 0 {
            return false
        } else {
            return true
        }
        
    }
    
}

extension CountedSet: ExpressibleByArrayLiteral {
    
    
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral elements: ArrayLiteralElement...) {
        self.init()
        
        for item in elements {
            guard let _ = dictionary[item] else {
                dictionary[item] = 1
                return
            }
            dictionary[item]! += 1
        }
        
    }
    
} //End of extension
