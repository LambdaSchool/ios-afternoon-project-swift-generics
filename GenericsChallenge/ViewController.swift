//
//  ViewController.swift
//  GenericsChallenge
//
//  Created by Bradley Yin on 9/4/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
        var aCountedSet = CountedSet<Arrow>()
        print(aCountedSet[.iron]) // 0
        var myCountedSet: CountedSet<Arrow> = [.magic, .iron, .iron, .silver, .iron, .iron]
        print(myCountedSet[.iron]) // 4
        print(myCountedSet.remove(.iron)) // 3
        print(myCountedSet.remove(.dwarvish)) // 0
        print(myCountedSet.remove(.magic)) // 0
        print(myCountedSet.count())
    }


}

