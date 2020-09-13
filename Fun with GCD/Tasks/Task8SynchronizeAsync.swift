//
//  Task8SynchronizeAsync.swift
//  Fun with GCD
//
//  Created by aronskaya on 19.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

// An example of synchronizing execution of an asynchronous API
func task8SynchronizeAsync() {
    let semaphore = DispatchSemaphore(value: 0)

    print("start")
    concurrentQueue.async {
        for i in 0..<10 {
            work()
            print("inside \(i)")
        }
        semaphore.signal()
    }

    // never block your thread forever like this: _ = semaphore.wait(timeout: .distantFuture)
    // always have a timeout, like 10 sec here
    _ = semaphore.wait(timeout: .now() + 10)

    print("finish")
}



