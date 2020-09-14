#  Fun with Grand Central Dispatch

This project is a showcase for most concepts and tasks, that we can perfrom using Grand Central Dispatch. I have prepared it being for my iOS Expert role at [iOS Ukraine conference #1](https://www.facebook.com/events/316585402972291), that took place in September 2020.

It consists of a series of tasks, from basic to more complex, that illustrate how something works or how a certain problem is usually solved.

## How to use it
Open ViewController.swift and uncomment a task you are interested in. Run!

### 0️⃣ Task 0
Illustrates [how synchronous execution works](Fun%20with%20GCD/Tasks/Task0SynchronousExecution.swift)

### 1️⃣ Task 1
Illustrates [how asynchronous execution works](Fun%20with%20GCD/Tasks/Task1AsynchronousExecution.swift)

### 2️⃣ Task 2
Illustrates [how concurrent and serial queues work](Fun%20with%20GCD/Tasks/Task2SerialConcurrent.swift)

### 3️⃣ Task 3
Illustrates [how the system handles queues with different quality of service](Fun%20with%20GCD/Tasks/Task3Priority.swift)

### 4️⃣ Task 4
Illustrates [how the system handles queues with different quality of service comparing to main queue](Fun%20with%20GCD/Tasks/Task4Priority+Main.swift)

### 5️⃣ Task 5
Illustrates [how the system handles queues with different quality of service](Fun%20with%20GCD/Tasks/Task5UpdateUI.swift)

### 6️⃣ Task 6
Illustrates concurrent access to a property and [a way to protect a property](Fun%20with%20GCD/Tasks/Task6SyncWriteAsyncRead.swift)

### 7️⃣ Task 7
Illustrates [how concurrent execution of a not protected section of code can crash an app](Fun%20with%20GCD/Tasks/Task7RaceCondition.swift) in a place where everything looks fine

### 8️⃣ Task 8
Illustrates [how to synchronize an asynchronous API](Fun%20with%20GCD/Tasks/Task8SynchronizeAsync.swift)

### 9️⃣ Task 9
Shows [how to create own very simple asynchronous interface](Fun%20with%20GCD/Tasks/Task9ProvideAsyncInterface.swift)

### 🔟 Task 10
Shows [how to create an asynchronous interface in a way, that is used extnsively in Apple products](Fun%20with%20GCD/Tasks/Task10AsynInterfaceAppleStyle.swift)

### 1️⃣1️⃣ Task 11
Know [how to deadlock (so you won't do it)](Fun%20with%20GCD/Tasks/Task11HowToDeadlock.swift)

### 1️⃣2️⃣ Task 12
Illustrates [how to execute a completion after several asynchronous tasks are finished](Fun%20with%20GCD/Tasks/Task12CompletionAfterSeveralTasks.swift) (like updating UI after getting responses on several API requests)

## Further Reading
There is an excellent book on GCD: 'Pro Multythreading and Memory Management for iOS and OSX with ARC, Grand Central Dispatch and Blocks' by Kazuki Sakamoto and Tomohiko Furumoto.
