//
//  Project.m
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Project.h"

@implementation Project

-(void)AddEntry:(Entry *)entry {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.Entries];
    [array addObject:entry];
    self.Entries = array;
    
}

-(void)RemoveEntry:(Entry *)entry {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.Entries];
    for (NSInteger i = 0; i < self.Entries.count; i++) {
        if ([array[i] isEqual:entry])
        {
            [array removeObject:entry];
        }
    }
    self.Entries = array;
}
@end
