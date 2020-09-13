//
//  Task6SyncWriteAsyncRead.swift
//  Fun with GCD
//
//  Created by aronskaya on 19.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

func task6SyncWriteAsyncRead() {
    let instance = Person()

    for _ in (0 ..< 10000) {
        concurrentQueue.async {
            instance.name = randomString(length:24)
            print(instance.name)
        }
    }
}

final class Person {

    // correct handling of concurrent access:
    private var _name: String = ""
    private let nameQueue = DispatchQueue(label: "", attributes: [.concurrent])
    var name: String {
        get { nameQueue.sync { return _name } } // concurrent read (many reads at a time)
        set { nameQueue.async(flags: [.barrier]) { [weak self] in self?._name = newValue } } // .barrier: 1 write at a time, no other reads or writes
    }

    // incorrect handling of concurrent access
    // uncomment next line and run
//    var name = ""
}

