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
- (void) AddProject:(Project *)project;
- (void) RemoveProject:(Project *)project;
- (NSDictionary *) projectAsDictionary:(Project *)project;
- (Project *)projectFromDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)entryAsDictionary:(Entry *)entry;
- (Entry *)entryFromDictionary:(NSDictionary *)dictionary;
- (void) saveProjects;
- (void) loadProjects;

@end
