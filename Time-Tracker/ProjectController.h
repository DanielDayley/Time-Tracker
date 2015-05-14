//
//  ProjectController.h
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"

@interface ProjectController : NSObject

@property (strong, nonatomic) NSArray *Projects;

+ (instancetype) sharedInstance;

-(void) AddProject:(Project *)project;

-(void) RemoveProject:(Project *)project;

- (NSDictionary *) ProjectAsDictionary:(Project *)project;

-(Project *)ProjectFromDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)EntreyAsDictionary:(Entry *)entry;

-(Entry *)EntryFromDictionary:(NSDictionary *)dictionary;


@end
