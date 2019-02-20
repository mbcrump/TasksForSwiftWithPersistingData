# Task App for Swift that Persist Data with Core Data (iOS) 
================

## Updated for Xcode 10 with Swift 4.2

Originally by: [Michael Crump](http://twitter.com/mbcrump)
Updates for Xcode 10 with Swift 4.2 by David Phillip Oster

The original blog post for this article can be found [here,](http://developer.telerik.com/featured/creating-task-application-ios-using-swift/) but it does not include some of the cosmetic tweaks that this version has, nor does it persist data. If you are looking for a simple example of creating a Task app then check my my other [repo.](https://github.com/mbcrump/TasksForSwift)

Below is a demo from the app that is in the AppStore: 

![image](https://github.com/mbcrump/TasksForSwiftWithPersistingData/blob/master/Images/demo.gif)

[Here is the app in the AppStore](https://itunes.apple.com/us/app/task-application/id960435759?ls=1&mt=8)

## Oster's comments:

I took advantage of Xcode's 'Generated NSManagedObjects subclasses' menu command to directly access the Core Data `Task` object. I fixed the appDelegate methods that the operating system was not calling. I removed the do-nothing tests directory and target. I added  [sumitmukhija](https://github.com/sumitmukhija)'s U.I. for denoting a completed task, but I also connected it through to the underlying data model. The original app had no way to update an existing record. Added.

#### Here is Michael Crump's contact info

[Twitter](http://twitter.com/mbcrump)

[Blog](http://michaelcrump.net)

[About Me](http://about.me/mbcrump)
