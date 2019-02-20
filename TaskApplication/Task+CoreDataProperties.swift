import Foundation
import CoreData

extension Task {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
    return NSFetchRequest<Task>(entityName: "Task")
  }
  
  @NSManaged public var desc: String?
  @NSManaged public var isDone: NSNumber?
  @NSManaged public var name: String?
  
}
