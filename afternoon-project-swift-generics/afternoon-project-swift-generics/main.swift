//
//  main.swift
//  afternoon-project-swift-generics
//
//  Created by Hector Steven on 6/11/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

/*
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0

*/


struct CountedSet<Element: Hashable> {
	private (set) var elements: [Element: Int] =  [:]
	
	//Add insertion and removal (insert and remove) of one element at a time.
	
	mutating func  insert(_ element: Element) {
		elements[element, default: 0] = 1
	}
	ç
	mutating func remove(_ element: Element) {
		elements.removeValue(forKey: element)
	}
	
}

//enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var set = CountedSet<String>()

set.insert("String")
set.insert("String1")
set.insert("String2")
set.insert("String3")
set.insert("String4")
set.insert("String4")


print(set)


