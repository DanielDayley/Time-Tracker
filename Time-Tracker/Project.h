//
//  Project.h
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface Project : NSObject

@property (strong, nonatomic) NSArray *Entries;

- (void) AddEntry:(Entry *)entry;

-(void) RemoveEntry:(Entry *)entry;
@end
