//
//  Task9ProvideAsyncInterface.swift
//  Fun with GCD
//
//  Created by aronskaya on 19.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

class Client {
    private var url: URL?
    private var otherPropety = ""
    private let workQueue = DispatchQueue(label: "com.workQueue")

    func task9ProvideAsyncInterface() {
        let archiver = GzipArchiver()
        print("Will archive")
        archiver.archive(url: URL(fileURLWithPath: "/"), onQueue: workQueue) { [weak self] (url) in
            self?.url = url
            print("Archived \(String(describing: url))")
            // do some other work with other properties, etc.
            self?.otherPropety = ""
        }
        print("Returned from calling client function")
    }
}


/// Example of a simple async interface
/// Straightforward interface with a couple of possible problems:
/// * if called several times on the same URL, we could have file system-related problems
/// * with concurrent archiving queue file system-related issues can arise
/// * archiving queue can be serial, in this case all archiving tasks will have to wait
/// * if we need more handlers or other parameters, interface becomes not pretty
protocol Archiver {
    func archive(url: URL, onQueue completionQueue: DispatchQueue, completionHandler: @escaping (URL?) -> Void)
    func archive(url: URL, completionHandler: @escaping (URL?) -> Void)
}

class GzipArchiver: Archiver {

    private let archivingQueue = DispatchQueue(label: "com.aronskaya.archiving", attributes: [.concurrent])

    func archive(url: URL, onQueue completionQueue: DispatchQueue, completionHandler: @escaping (URL?) -> Void) {
        archivingQueue.async { [weak self] in
            guard let self = self else { return }
            let result = self.gzip(url: url)

            completionQueue.async {
                completionHandler(result)
            }
        }
    }

    func archive(url: URL, completionHandler: @escaping (URL?) -> Void) {
        archivingQueue.async { [weak self] in
            guard let self = self else { return }
            let result = self.gzip(url: url)

            // when in doubt, dispatch to main
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }
    }

    private func gzip(url: URL) -> URL? {
        // stub
        sleep(1)
        return URL(fileURLWithPath: "/")
    }
}
