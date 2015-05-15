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

-(instancetype)init {
    self = [super init];
    Entry *blankEntry = [Entry new];
    self.entries = @[blankEntry];
//    NSLog(@"Current Project.entries: %@",blankEntry);
    return self;
}

-(void)AddEntry:(Entry *)entry {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.entries];
//    NSLog(@"'array' looks like this:  %@",array);
    [array addObject:entry];
    NSLog(@"Added entry %@ to project entries.",entry);
    self.entries = array;
    
}

-(void)RemoveEntry:(Entry *)entry {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.entries];
    for (NSInteger i = 0; i < self.entries.count; i++) {
        if ([array[i] isEqual:entry])
        {
            [array removeObject:entry];
            NSLog(@"Removed entry %@ from project entries.",entry);
        }
    }
    self.entries = array;
}

- (void) startNewEntry {
    Entry *newEntry = [[Entry alloc] init];
    newEntry.startTime =  [NSDate new];
    NSLog(@"Starting new entry %@.",newEntry);
    self.currentEntry = newEntry;
    
}

- (void) endCurrentEntry {
    self.currentEntry.endTime = [NSDate new];
    NSLog(@"Setting end time for current entry");

}
@end
