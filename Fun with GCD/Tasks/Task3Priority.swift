//
//  Task3Priority.swift
//  Command-Line Tool
//
//  Created by aronskaya on 19.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

let classes: [DispatchQoS] = [ .userInteractive,
                               .userInitiated,
                               .default,
                               .utility,
                               .background,
                               .unspecified]

let userInteractive = DispatchQueue(label: "com.userInteractive", qos: .userInteractive)
let userInitiated = DispatchQueue(label: "com.userInitiated", qos: .userInitiated)

let `default` = DispatchQueue(label: "com.`default`", qos: .default) // default QoS if none is specified

let utility = DispatchQueue(label: "com.utility", qos: .utility)
let background = DispatchQueue(label: "com.background", qos: .background)

let unspecified = DispatchQueue(label: "com.unspecified", qos: .unspecified) // exists to support legacy APIs; not intended to be used directly


func task3Priority() {

    // uncomment to print the raw values of different classes
//    for `class` in classes {
//        print("\(`class`.name) : \(`class`.qosClass.rawValue)")
//    }

    userInteractive.async {
        for i in 0..<10 {
            work(description: "\(userInteractive.qos.fruitRepresentation) \(i) \(userInteractive.qos.name)")
        }
    }

    userInitiated.async {
        for i in 0..<10 {
            work(description: "\(userInitiated.qos.fruitRepresentation) \(i) \(userInitiated.qos.name)")
        }
    }

    `default`.async {
        for i in 0..<10 {
            work(description: "\(`default`.qos.fruitRepresentation) \(i) \(`default`.qos.name)")
        }
    }

    utility.async {
        for i in 0..<10 {
            work(description: "\(utility.qos.fruitRepresentation) \(i) \(utility.qos.name)")
        }
    }

    background.async {
        for i in 0..<10 {
            work(description: "\(background.qos.fruitRepresentation) \(i) \(background.qos.name)")
        }
    }

    unspecified.async {
        for i in 0..<10 {
            work(description: "\(unspecified.qos.fruitRepresentation) \(i) \(unspecified.qos.name)")
        }
    }
}

extension DispatchQoS {

    var name: String {
        switch self {
        case .userInteractive:
            return "userInteractive"
        case .userInitiated:
            return "userInitiated"
        case .default:
            return "default"
        case .utility:
            return "utility"
        case .background:
            return "background"
        case .unspecified:
            return "unspecified"
        default:
            return "?"
        }
    }

    var fruitRepresentation: String {
        return repeating("🍌", count: fruitQuantity)
    }

    var fruitQuantity: Int {
        switch self {
        case .userInteractive:
            return 6
        case .userInitiated:
            return 5
        case .default:
            return 4
        case .utility:
            return 3
        case .background:
            return 2
        case .unspecified:
            return 1
        default:
            return 0
        }
    }
}

/*
Example output:
 🍌🍌🍌🍌🍌🍌 0 userInteractive
 🍌 0 unspecified
 🍌🍌🍌🍌🍌 0 userInitiated
 🍌🍌🍌🍌 0 default
 🍌🍌🍌 0 utility
 🍌🍌 0 background
 🍌🍌🍌🍌🍌 1 userInitiated
 🍌🍌🍌🍌🍌🍌 1 userInteractive
 🍌 1 unspecified
 🍌🍌🍌🍌 1 default
 🍌🍌🍌🍌🍌 2 userInitiated
 🍌🍌🍌🍌🍌🍌 2 userInteractive
 🍌 2 unspecified
 🍌🍌🍌🍌 2 default
 🍌🍌🍌🍌🍌 3 userInitiated
 🍌🍌🍌🍌🍌🍌 3 userInteractive
 🍌 3 unspecified
 🍌🍌🍌🍌 3 default
 🍌🍌🍌🍌🍌 4 userInitiated
 🍌🍌🍌🍌🍌🍌 4 userInteractive
 🍌🍌🍌🍌 4 default
 🍌 4 unspecified
 🍌🍌🍌 1 utility
 🍌🍌🍌🍌🍌 5 userInitiated
 🍌🍌🍌🍌🍌🍌 5 userInteractive
 🍌🍌🍌🍌 5 default
 🍌 5 unspecified
 🍌🍌🍌🍌🍌 6 userInitiated
 🍌🍌🍌🍌🍌🍌 6 userInteractive
 🍌 6 unspecified
 🍌🍌🍌🍌 6 default
 🍌🍌🍌🍌🍌 7 userInitiated
 🍌🍌🍌🍌🍌🍌 7 userInteractive
 🍌🍌 1 background
 🍌 7 unspecified
 🍌🍌🍌🍌 7 default
 🍌🍌🍌🍌🍌🍌 8 userInteractive
 🍌🍌🍌🍌🍌 8 userInitiated
 🍌 8 unspecified
 🍌🍌🍌🍌 8 default
 🍌🍌🍌🍌🍌🍌 9 userInteractive
 🍌🍌🍌🍌🍌 9 userInitiated
 🍌 9 unspecified
 🍌🍌🍌 2 utility
 🍌🍌🍌🍌 9 default
 🍌🍌🍌 3 utility
 🍌🍌🍌 4 utility
 🍌🍌🍌 5 utility
 🍌🍌🍌 6 utility
 🍌🍌🍌 7 utility
 🍌🍌🍌 8 utility
 🍌🍌 2 background
 🍌🍌🍌 9 utility
 🍌🍌 3 background
 🍌🍌 4 background
 🍌🍌 5 background
 🍌🍌 6 background
 🍌🍌 7 background
 🍌🍌 8 background
 🍌🍌 9 background

 */
