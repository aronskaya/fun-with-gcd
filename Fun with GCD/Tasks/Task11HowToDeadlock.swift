//
//  Task8HowToDeadlock.swift
//  Fun with GCD
//
//  Created by aronskaya on 19.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

// Calling .sync on a serial queue will deadlock
// Be espesially careful with the main queue: dispatch to it asynchronously:
//
// DispatchQueue.main.async {
//     updateUI()
// }

// Try to replace serialQueue in this task with concurrentQueue. It won't deadlock

func task11HowToDeadlock() {
    serialQueue.async {
        // we are now on a serial queue
        // an attempt to exeute synchronously anything on it will deadlock
        serialQueue.sync {
            print("Will never be executed")
        }
    }
}
