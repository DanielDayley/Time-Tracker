//
//  Project.m
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Project.h"

@interface Project ()

@property (strong, nonatomic) Entry *currentEntry;

@end

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

- (void) startNewEntry {
    Entry *newEntry = [[Entry alloc] init];
    newEntry.StartTime =  [NSDate new];
    
    self.currentEntry = newEntry;
    
}

- (void) endCurrentEntry {
    self.currentEntry.EndTime = [NSDate new];
}
@end
