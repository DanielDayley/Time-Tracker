//
//  Entry.h
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (strong, nonatomic) NSDate *StartTime;
@property (strong, nonatomic) NSDate *EndTime;

@property (strong, nonatomic) NSString *Name;

@end
