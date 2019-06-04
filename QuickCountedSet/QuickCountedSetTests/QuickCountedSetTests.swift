//
//  QuickCountedSetTests.swift
//  QuickCountedSetTests
//
//  Created by Michael Redig on 6/4/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import XCTest
@testable import QuickCountedSet


enum Arrow: String { case iron, wooden, elven, dwarvish, magic, silver }
extension Arrow: CustomStringConvertible {
	var description: String {
		return self.rawValue
	}
}

class QuickCountedSetTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	/// changing values here will break tests! it'll have cascading effects! don't!
	func defaultSets() -> (aSet: QuickCountedSet<Arrow>, bSet: QuickCountedSet<Arrow>, cSet: QuickCountedSet<Arrow>) {
		var aQuickCountedSet = QuickCountedSet<Arrow>()
		for _ in 1...5 {
			aQuickCountedSet.insert(.dwarvish)
		}
		for _ in 1...2 {
			aQuickCountedSet.insert(.elven)
		}
		for _ in 1...1 {
			aQuickCountedSet.insert(.iron)
		}

		var bQuickCountedSet = QuickCountedSet<Arrow>()
		for _ in 1...4 {
			bQuickCountedSet.insert(.dwarvish)
		}
		for _ in 1...2 {
			bQuickCountedSet.insert(.elven)
		}

		var cQuickCountedSet = QuickCountedSet<Arrow>()
		cQuickCountedSet = [.wooden, .wooden]
		return (aQuickCountedSet, bQuickCountedSet, cQuickCountedSet)
	}

	func combinedAB() -> QuickCountedSet<Arrow> {
		let (aSet, bSet, _) = defaultSets()

		var newSet = QuickCountedSet<Arrow>()
		for item in aSet {
			newSet[item.member] += item.count
		}
		for item in bSet {
			newSet[item.member] += item.count
		}
		return newSet
	}

	/// if this one fails, we can't trust any of the other results
	func testEquatable() {
		let (aSet, bSet, _) = defaultSets()
		let dupA = aSet
		XCTAssert(aSet == dupA)
		XCTAssertFalse(aSet == bSet)
		XCTAssertFalse(aSet != dupA)
		XCTAssert(aSet != bSet)

		XCTAssert(aSet.count == dupA.count)
		for item in aSet {
			XCTAssert(dupA[item.member] == item.count)
		}
	}

	func basicTests() {
		var aQuickCountedSet = QuickCountedSet<Arrow>()
		XCTAssert(aQuickCountedSet[.iron] == 0)
		var myQuickCountedSet: QuickCountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
		XCTAssert(myQuickCountedSet[.iron] == 4) // 4
		myQuickCountedSet.remove(.iron) // 3
		XCTAssert(myQuickCountedSet[.iron] == 3) // 4
		myQuickCountedSet.remove(.dwarvish) // 0
		XCTAssert(myQuickCountedSet[.dwarvish] == 0)
		myQuickCountedSet.remove(.magic) // 0
		XCTAssert(myQuickCountedSet[.magic] == 0)

	}

	func unionTests() {
		var (aSet, bSet, _) = defaultSets()
		let comboAnswer = combinedAB()
		let aSave = aSet
		let bSave = bSet

		let cSet = aSet.unioned(with: bSet)
		XCTAssert(cSet == comboAnswer)
		XCTAssert(aSet == aSave)
		XCTAssert(bSet == bSave)


		aSet.union(with: bSet)
		XCTAssert(aSet == comboAnswer)
		XCTAssert(aSet != aSave)
		XCTAssert(bSet == bSave)
	}

	// MARK: - intersection tests
	func testIntersection() {
		var (aSet, bSet, _) = defaultSets()
		let answer = QuickCountedSet([Arrow.elven, Arrow.elven])
		let aSave = aSet
		let bSave = bSet

		let cSet = aSet.intersected(with: bSet)
		XCTAssert(cSet == answer)
		XCTAssert(aSet == aSave)
		XCTAssert(bSet == bSave)

		aSet.intersection(with: bSet)
		XCTAssert(aSet == answer)
		XCTAssert(aSet != aSave)
		XCTAssert(bSet == bSave)
	}


	// MARK: - subtraction tests
	func testSubtraction() {
		var (aSet, bSet, _) = defaultSets()
		let answer = QuickCountedSet([Arrow.iron, Arrow.dwarvish])
		let aSave = aSet
		let bSave = bSet

		let cSet = aSet.subtracted(bSet)
		XCTAssert(cSet == answer)
		XCTAssert(aSet == aSave)
		XCTAssert(bSet == bSave)

		aSet.subtraction(bSet)
		XCTAssert(aSet == answer)
		XCTAssert(aSet != aSave)
		XCTAssert(bSet == bSave)
	}

	// MARK: - disjoint tests
	func testDisjoint() {
		let (aSet, bSet, cSet) = defaultSets()

		XCTAssertFalse(aSet.isDisjoint(bSet))
		XCTAssert(aSet.isDisjoint(cSet))
		XCTAssert(bSet.isDisjoint(cSet))
	}
}
