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


class test {
	
	var test1 = {
		var set = CountedSet<String>()
		set.insert("String")
		set.insert("String1")
		set.insert("String2")
		set.insert("String3")
		set.insert("String3")
		set.insert("String4")
		set.insert("String4")
		set.insert("String4")
		set.insert("String4")
		print(set["String4"])
		print(set)
	}

	var test2 = {
		enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
		//var myCountedSet = CountedSet<Arrow>()
		var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
		myCountedSet.insert(.dwarvish)
		myCountedSet.insert(.dwarvish)
		myCountedSet.insert(.elven)
		myCountedSet.insert(.elven)
		myCountedSet.insert(.silver)
		myCountedSet.insert(.magic)
		
		
		print(myCountedSet[.iron])
		let count = myCountedSet.count
		print(,count)
		print(myCountedSet.isEmpty)
		
//		myCountedSet.remove(.iron) // 3
//		myCountedSet.remove(.dwarvish) // 0
//		myCountedSet.remove(.magic) // 0

	}
	
}

struct CountedSet<Element: Hashable> {
	var elements: [Element: Int] =  [:]
	
	var count: Int  {
		return elements.count
	}
	
	var isEmpty: Bool {
		return self.count == 0 ? true : false
	}
	
	mutating func  insert(_ element: Element) {
		elements[element, default: 0] += 1
	}
	
	mutating func remove(_ element: Element) {
		elements.removeValue(forKey: element)
	}
	
	/// returns 0 on error
	subscript(_ member: Element) -> Int {
		get {
			return elements[member] ?? 0
		}
	}
	
}

extension CountedSet: ExpressibleByArrayLiteral {
	init(arrayLiteral: Element...) {
		self.init()
		for element in arrayLiteral {
			self.insert(element)
		}
	}
}

test().test2()




