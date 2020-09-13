//
//  Task7RaceCondition.swift
//  Fun with GCD
//
//  Created by aronskaya on 19.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

// Can we fail on force unwrap here? Run several times and see

func task7RaceCondition() {
    let instance = Counter()

    for _ in (0 ..< 1000) {
        // we are accessing the property from a concurrent queue,
        // which means one thread can set it to nil and after that another thread will try to force unwrap
        // takeaway 1: never force unwrap in production code
        // takeaway 2: even synchronized access can't protect you in situations like this
        concurrentQueue.async {
            instance.count = nil
            instance.count = 20
            print(instance.count!)
        }
    }
}

final class Counter {

    var count: Int? {
        get { return countQueue.sync { return _count } }
        set { countQueue.async(flags: .barrier) { [weak self] in self?._count = newValue } }
    }
    private var _count: Int? = 0
    private let countQueue = DispatchQueue(label: "com.aronskaya.countQueue", attributes: [.concurrent])
}
