//
//  ViewController.swift
//  Generics
//
//  Created by Waseem Idelbi on 7/8/20.
//  Copyright © 2020 Waseem Idelbi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var mySet = CountedSet<Int>()
        
        mySet.insert(1)
        mySet.insert(1)
        mySet.insert(2)
        mySet.insert(2)
        mySet.insert(2)
        mySet.insert(3)
        mySet.insert(3)
        mySet.insert(3)
        mySet.insert(8)
        
        print(mySet[1])
        
        print(mySet.count())
        print(mySet.isEmpty())
        
    }


}

