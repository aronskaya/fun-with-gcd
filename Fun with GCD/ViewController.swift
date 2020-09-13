//
//  ViewController.swift
//  Fun with GCD
//
//  Created by aronskaya on 26.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    let client = Client()

    override func viewDidAppear(_ animated: Bool) {

//        task0SynchronousExecution()
//        task1AsynchronousExecution()
//        task2SerialConcurrent()
//        task3Priority()
//        task4PriorityMain()
//        task5UpdateUI(label: label)
//        task6SyncWriteAsyncRead()
//        task7RaceCondition()
//        task8SynchronizeAsync()
        client.task9ProvideAsyncInterface()
        task11HowToDeadlock()
        task12CompletionAfterSeveralTasks()
    }
}

