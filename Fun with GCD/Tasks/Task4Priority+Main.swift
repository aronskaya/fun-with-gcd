//
//  Task4Priority+Main.swift
//  Fun with GCD
//
//  Created by aronskaya on 19.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

// What is the priority of the main queue?
// Print and see, 

func task4PriorityMain() {

    DispatchQueue.main.async {
        for i in 0..<5 {
            work(description: "🍓 \(i) main")
        }
    }

    task3Priority()
}

/*
Example output:

 🍌🍌🍌🍌🍌🍌 0 userInteractive
 🍌🍌🍌🍌 0 default
 🍌 0 unspecified
 🍌🍌🍌🍌🍌 0 userInitiated
 🍓 0 main
 🍌🍌 0 background
 🍌🍌🍌 0 utility
 🍌🍌🍌🍌🍌🍌 1 userInteractive
 🍓 1 main
 🍌🍌🍌🍌🍌 1 userInitiated
 🍌 1 unspecified
 🍌🍌🍌🍌 1 default
 🍌🍌🍌🍌🍌🍌 2 userInteractive
 🍓 2 main
 🍌🍌🍌🍌🍌 2 userInitiated
 🍌 2 unspecified
 🍌🍌🍌🍌 2 default
 🍌🍌🍌🍌🍌🍌 3 userInteractive
 🍓 3 main
 🍌🍌🍌🍌🍌 3 userInitiated
 🍌 3 unspecified
 🍌🍌🍌🍌 3 default
 🍌🍌🍌 1 utility
 🍌🍌🍌🍌🍌🍌 4 userInteractive
 🍓 4 main
 🍌 4 unspecified
 🍌🍌🍌🍌🍌 4 userInitiated
 🍌🍌🍌🍌 4 default
 🍌🍌🍌🍌🍌🍌 5 userInteractive
 🍌 5 unspecified
 🍌🍌🍌🍌🍌 5 userInitiated
 🍌🍌🍌🍌 5 default
 🍌🍌🍌🍌🍌🍌 6 userInteractive
 🍌 6 unspecified
 🍌🍌🍌🍌🍌 6 userInitiated
 🍌🍌🍌🍌 6 default
 🍌🍌🍌🍌🍌🍌 7 userInteractive
 🍌 7 unspecified
 🍌🍌🍌🍌🍌 7 userInitiated
 🍌🍌🍌🍌 7 default
 🍌🍌 1 background
 🍌🍌🍌 2 utility
 🍌🍌🍌🍌🍌🍌 8 userInteractive
 🍌 8 unspecified
 🍌🍌🍌🍌🍌 8 userInitiated
 🍌🍌🍌🍌 8 default
 🍌🍌🍌🍌🍌🍌 9 userInteractive
 🍌 9 unspecified
 🍌🍌🍌🍌🍌 9 userInitiated
 🍌🍌🍌🍌 9 default
 🍌🍌🍌 3 utility
 🍌🍌🍌 4 utility
 🍌🍌🍌 5 utility
 🍌🍌 2 background
 🍌🍌🍌 6 utility
 🍌🍌🍌 7 utility
 🍌🍌🍌 8 utility
 🍌🍌🍌 9 utility
 🍌🍌 3 background
 🍌🍌 4 background
 🍌🍌 5 background
 🍌🍌 6 background
 🍌🍌 7 background
 🍌🍌 8 background
 🍌🍌 9 background

 */
