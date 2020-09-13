//
//  Task2SerialConcurrent.swift
//  Fun with GCD
//
//  Created by aronskaya on 11.09.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

let serialQueue = DispatchQueue(label: "com.serial")                // a queue is serial by default
let concurrentQueue = DispatchQueue(label: "com.concurrent", attributes: [.concurrent])

// See the print result. Serial queue always print all tasks in order they were scheduled
// Concurrent queue starts to simultaneously execute several tasks (iterations)
// takeaway: it is not safe to access shared resources from concurrent queues

func task2SerialConcurrent() {
    for iteration in 0..<3 {
        serialQueue.async {
            print("🍏       \(iteration)")
            print("🍏🍏     \(iteration)")
            print("🍏🍏🍏   \(iteration)")
        }

        concurrentQueue.async {
            print("🍎       \(iteration)")
            print("🍎🍎     \(iteration)")
            print("🍎🍎🍎   \(iteration)")
        }
    }
}

/*
Example output:

 🍏       0 // all iterations on serial queue 🍏 are perfromed in strict order
 🍏🍏     0
 🍎       1 // iteration 1 on concurrent queue 🍎 started before 0th iteration
 🍎🍎     1
 🍎🍎🍎   1
 🍏🍏🍏   0
 🍎       2
 🍎       0
 🍏       1 // itration 1 on serial queue started only after iteration 0 is done
 🍏🍏     1
 🍏🍏🍏   1
 🍎🍎     2
 🍎🍎🍎   2
 🍏       2
 🍏🍏     2
 🍏🍏🍏   2
 🍎🍎     0
 🍎🍎🍎   0
 */
