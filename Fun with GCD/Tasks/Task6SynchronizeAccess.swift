//
//  Task6SynchronizeAccess.swift
//  Fun with GCD
//
//  Created by aronskaya on 19.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

let instance = Person()

// run this task several times with 'version 1' and 'version 2' to see that it works with synchronization and crashes without
// maybe you will have to increase iterations number
func task6SynchronizeAccess() {
    let iterations = 10_000
    for iteration in (0 ..< iterations) {
        concurrentQueue.async {
            print("\(iteration) \(instance.name)")
            instance.name = randomString(length:24)
        }
    }
}

final class Person {

    // version 1:
    // correct handling of concurrent access:
    private var _name: String = "initial value"
    private let nameQueue = DispatchQueue(label: "")
    var name: String {
        get { return nameQueue.sync { _name } }
        set { nameQueue.async { self._name = newValue } }
    }

    // version 2:
    // incorrect handling of concurrent access
    // uncomment next line and run
//    var name = "initial value"
}

