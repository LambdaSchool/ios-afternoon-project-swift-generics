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


struct test {
	
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
		var myCountedSet = CountedSet<Arrow>()
		myCountedSet[.dwarvish] = 100
		print(myCountedSet[.dwarvish])
		print("myCountedSet.isEmpty = ", myCountedSet.isEmpty)
		myCountedSet = [.iron, .magic, .iron, .silver, .iron, .iron]
		
		myCountedSet.insert(.dwarvish)
		myCountedSet.insert(.dwarvish)
		myCountedSet.insert(.elven)
		myCountedSet.insert(.elven)
		myCountedSet.insert(.silver)
		myCountedSet.insert(.magic)
		
		print("myCountedSet[.iron] = ", myCountedSet[.iron])
		print("myCountedSet.cout = ", myCountedSet.count)
		print("myCountedSet.isEmpty = ", myCountedSet.isEmpty)
	}
	
	var test3 = {
		print("unit test3")
		enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
		var aCountedSet = CountedSet<Arrow>()
		
		if aCountedSet[.iron] == 0 { // 0
			print("Test 1 Passed")
		
		}
		var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
		
		if  myCountedSet[.iron] == 4 {
			print("Test 2 Passed")
		}
		
		myCountedSet.remove(.iron) // 3
		if myCountedSet[.iron] == 3 {
			print("Test 3 Passes")
		}
		
		myCountedSet.remove(.dwarvish) // 0
		if myCountedSet[.dwarvish] == 0 {
			print("Test 4 Passes")
		}else {
			print("Test 4 Failed: \n \(myCountedSet[.dwarvish]) != 0")
		}
		myCountedSet.remove(.magic) // 0
		if myCountedSet[.dwarvish] == 0 {
			print("Test 4 Passes")
		}else {
			print("Test 4 Failed: \n \(myCountedSet[.dwarvish]) != 0")
		}
	}

	var test4_contains = {
		var set = CountedSet<String>()
		set.insert("String")
		set.insert("String1")
		set.insert("String2")
		set.insert("String3")
		set.insert("String3")
		set.insert("String4")
		set["String4"] = 10
		print("set[String4] == ",set["String4"])
		
	}
}

struct CountedSet<Element: Hashable> {
	var count: Int  {
		return elements.count
	}
	
	var isEmpty: Bool {
		return self.count == 0 ? true : false
	}
	
	mutating func  insert(_ element: Element) {
		elements[element, default: 0] += 1
	}
	
	mutating func remove(_ e: Element) {
		guard let ecount = elements[e] else { return }
		if ecount == 1 {
			elements.removeValue(forKey: e)
		} else {
			self.elements[e, default: 0] -= 1
		}
	}
	
	func contains(_ e: Element) -> Bool {
		if let _ = elements[e] {
			return  true
		}
		
		return false
	}
	
	/// returns 0 on error
	subscript(_ member: Element) -> Int {
		get {
			return elements[member, default: 0]
		}
		
		set(newValue) {
			elements[member, default: 0] = newValue
		}
	}
	
	
	private (set) var elements: [Element: Int] =  [:]
}

extension CountedSet: ExpressibleByArrayLiteral {
	init(arrayLiteral: Element...) {
		self.init()
		for element in arrayLiteral {
			self.insert(element)
		}
	}
}

test().test4_contains()




