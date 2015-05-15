//
//  Entry.m
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

@implementation Entry

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.startTime = [[NSDate alloc] init];
        self.endTime = [[NSDate alloc] init];
        self.name = @"";
    }
    return self;
}

@end
