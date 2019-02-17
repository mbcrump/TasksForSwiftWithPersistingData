//  Task+CoreDataProperties.m
//  Created by David Phillip Oster on 2/17/19.
// Automatically generated using the 'Create NSManagedObject subclass' menu command.

#import "Task+CoreDataProperties.h"

@implementation Task (CoreDataProperties)

+ (NSFetchRequest<Task *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Task"];
}

@dynamic desc;
@dynamic isDone;
@dynamic name;

@end
