//
//  ViewController.swift
//  asd;lkfjsdalk;jlfklads;f
//
//  Created by Karen Rodriguez on 4/7/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit
struct CountedSet<Element: Hashable> {
    
    private var memCount: [Element : Int] = [:]
    var isEmpty: Bool {
        if memCount.count == 0 {
            return true
        }
        return false
    }
    var count: Int {
        return memCount.count
    }
    
    mutating func insert(member: Element) -> Int? {
        if memCount[member] == nil {
            memCount[member] = 1
        } else {
            memCount[member]! += 1
        }
        
        return memCount[member]
    }
    
    mutating func remove(_ member: Element) -> Int? {
        if memCount[member] == nil {
            return nil
        } else {
            memCount[member]! -= 1
        }
        
        return memCount[member]
    }
    
    subscript(_ member: Element) -> Int {
        get {
            return memCount[member] ?? 0
        }
        set(newValue) {
            insert(member: member)
        }
    }
    
    
}

extension CountedSet: ExpressibleByArrayLiteral {
    // MARK: - ExpressibleByArrayLiteral
    
    init(arrayLiteral elements: Element...) {
        
        for element in elements {
            insert(member: element)
        }
    }
}




class ViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
        var aCountedSet = CountedSet<Arrow>()
        
        var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
        
        print(aCountedSet[.iron]) // 0
        print(myCountedSet[.iron]) // 4
        print(myCountedSet.remove(.iron) )// 3
        print(myCountedSet.remove(.dwarvish)) // 0
        print(myCountedSet.remove(.magic) )// 0
    }


}

