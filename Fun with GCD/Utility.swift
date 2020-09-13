//
//  Utility.swift
//  Fun with GCD
//
//  Created by aronskaya on 26.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import UIKit

func randomEmoticon() -> String {
    let emoticon: [String] = {
        var result: [String] = []
        
        for codePoint in 0x1F600...0x1F64F {
            guard let scalarValue = Unicode.Scalar(codePoint) else {
                continue
            }
            if scalarValue.properties.isEmoji {
                result.append(String(scalarValue))
            }
        }
        return result
    }()
    
    return emoticon.randomElement() ?? "??"
}

func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).compactMap { _ in letters.randomElement() })
}

func randomData(length: Int) -> Data {
    guard let bytes = malloc(length) else {
        assertionFailure()
        return Data()
    }

    let data = Data(bytes: bytes, count: length)
    free(bytes)

    return data
}

let tempDirName = "temp"

// reads a file from disk and writes it to disk
// imitates real-life work, that an app does
func work(description: String? = nil, printAfter: Bool = false) {
    guard let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
        assertionFailure()
        return
    }

    if let description = description {
        printAfter ? print(description + " before") : print(description)
    }

    let destination = URL(fileURLWithPath: documents).appendingPathComponent(tempDirName)
    try? FileManager.default.createDirectory(at: destination, withIntermediateDirectories: true, attributes: nil)

    // generate 10 files and write them to disk
    for _ in 0..<10 {
        let count = Int(arc4random_uniform(500_000)) + 500_000

        // randomize file name, so each time we will write a new file
        let randomName = randomString(length: 36)
        do {
            try randomData(length: count).write(to: destination
                .appendingPathComponent(randomName))
        } catch {
            print(error)
        }
    }
    
    if let description = description, printAfter {
        print(description + "after")
    }
}

func repeating(_ string: String, count: Int) -> String {
    var result = ""
    for _ in 0..<count {
        result += string
    }
    return result
}

func cleanup() {
    guard let destination = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
        assertionFailure()
        return
    }

    print("Documents dir: \(destination)")

    try? FileManager.default.removeItem(at: URL(fileURLWithPath: destination).appendingPathComponent(tempDirName))
}



