//
//  Task10AsynInterfaceAppleStyle.swift
//  Fun with GCD
//
//  Created by aronskaya on 12.09.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import Foundation

// A more flexible, than Task9, asynchronous interface
// This approach is extensively used in Apple products
protocol ArchiverAppleStyle {
    init(url: URL, progressHandler: ((Double) -> Void)?, completionHandler: @escaping (URL) -> Void, completionQueue: DispatchQueue)
    func activate()
    func invalidate()
}

final class GzipArchiverAppleStyle: ArchiverAppleStyle {

    private let archivingQueue = DispatchQueue(label: "com.archiver", attributes: [.concurrent])
    private let url: URL
    private let completionHandler: (URL) -> Void
    private let completionQueue: DispatchQueue
    private let progressHandler: ((Double) -> Void)?

    init(url: URL, progressHandler: ((Double) -> Void)?,
         completionHandler: @escaping (URL) -> Void,
         completionQueue: DispatchQueue) {
        self.url = url
        self.completionHandler = completionHandler
        self.completionQueue = completionQueue
        self.progressHandler = progressHandler
    }

    func activate() {
        archivingQueue.async { [weak self] in
            guard let self = self else { return }
            let result = self.gzip()
            self.completionQueue.async {
                self.completionHandler(result)
            }
        }
    }

    func invalidate() { }

    private func gzip() -> URL {
        return URL(fileURLWithPath: "/")
    }
}
