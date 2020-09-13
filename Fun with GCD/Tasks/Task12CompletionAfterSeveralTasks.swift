//
//  Task12CompletionAfterSeveralTasks.swift
//  Fun with GCD
//
//  Created by aronskaya on 12.09.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

// This task illustrates a common problem: we need to perform several tasks asynchronously and after the last one finishes,
// perform another task, like updating UI after all the data has been fetched from several APIs.
func task12CompletionAfterSeveralTasks() {
    let workQueue = DispatchQueue(label: "com.workQueue", attributes: [.concurrent])
    let group = DispatchGroup()

    // synchronous execution
    group.enter()
    print("action 1")
    work()
    group.leave()

    // asynchronous execution here and below
    group.enter()
    workQueue.async {
        work()
        work()
        work()
        print("action 2")
        group.leave()
    }

    group.enter()
    workQueue.async {
        work()
        print("action 3")
        group.leave()
    }

    // will be executed after all the other tasks are finished
    group.notify(queue: workQueue) {
        print("last action")
    }
}
