//
//  AddExerciseViewController.h
//  GymLog
//
//  Created by Feifan Zhou on 1/4/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutMO.h"
#import "ExerciseMO.h"

@interface AddExerciseViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) ExerciseMO *exercise;

+ (AddExerciseViewController *)addExerciseToWorkout:(WorkoutMO *)workout;
@end