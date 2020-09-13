//
//  Task1AsynchronousExecution.swift
//  Fun with GCD
//
//  Created by aronskaya on 11.09.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

func task1AsynchronousExecution() {
    print("🍉")

    DispatchQueue.global().async {
        for _ in 0..<10 { print("🍎") }
    }

    print("🥑")
}

/*
Example output:

 🍉
 🥑
 🍎
 🍎
 🍎
 🍎
 🍎
 🍎
 🍎
 🍎
 🍎
 🍎

 */
