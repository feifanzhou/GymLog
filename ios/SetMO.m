//
//  SetMO.m
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "SetMO.h"
#import "ExerciseMO.h"
#import "DataController.h"

@implementation SetMO

+ (NSString *)entityName {
  return @"Set";
}
+ (NSFetchRequest *)entityFetchRequest {
  return [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
}

+ (SetMO *)create:(NSDictionary *)attributes {
  SetMO *set = [NSEntityDescription insertNewObjectForEntityForName:@"Set" inManagedObjectContext:[DataController sharedController].managedObjectContext];
  set.uid = [NSDate timeIntervalSinceReferenceDate];
  set.exercise = attributes[@"exercise"];
  [set update:attributes save:YES];
  return set;
}
- (void)update:(NSDictionary *)attributes save:(BOOL)shouldSave {
  NSDate *attrCreatedAt = attributes[@"createdAt"];
  if (attrCreatedAt)
    self.createdAt = [attrCreatedAt timeIntervalSince1970];
  NSNumber *attrRepCount = attributes[@"repCount"];
  if (attrRepCount)
    self.repCount = [attrRepCount shortValue];
  NSNumber *attrWeight = attributes[@"weight"];
  if (attrWeight)
    self.weight = [attrWeight shortValue];
  
  if (shouldSave)
    [[DataController sharedController] persist];
}

- (NSDictionary *)asJSON {
  return @{
           @"createdAt": @(self.createdAt),
           @"repCount": @(self.repCount),
           @"weight": @(self.weight)
         };
}

- (void)destroy {
  [self.exercise removeSetsObject:self];
  [[DataController sharedController] persist];
}

@end
