//
//  Task0SynchronousExecution.swift
//  Fun with GCD
//
//  Created by aronskaya on 13.09.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

func task0SynchronousExecution() {
    print("🍉")

    DispatchQueue.global().sync {
        for _ in 0..<10 { print("🍏") }
    }

    print("🥑")
}

/*
Example output:

 🍉
 🍏
 🍏
 🍏
 🍏
 🍏
 🍏
 🍏
 🍏
 🍏
 🍏
 🥑
 
 */
