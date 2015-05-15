//
//  ProjectController.m
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProjectController.h"

@implementation ProjectController

+ (instancetype) sharedInstance {
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ProjectController alloc] init];
        sharedInstance.Projects = @[];
    });
    return sharedInstance;
}

- (void) AddProject:(Project *)project {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.Projects];
    [array addObject:project];
    self.Projects = array;
    NSLog(@"Added project %@ to project array.",project);
    
}

- (void) RemoveProject:(Project *)project {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.Projects];
    for (Project *i in array) {
        if ([i isEqual:project]) {
            [array removeObject:i];
        }
    }
    self.Projects = array;
    NSLog(@"Removed project %@ from project array.",project);

}

- (NSDictionary *) projectAsDictionary:(Project *)project {
    NSDictionary *dictionary = @{@"Entries Array" : project.entries};
    return dictionary;
}

- (Project *)projectFromDictionary:(NSDictionary *)dictionary {
    Project *project = [[Project alloc] init];
    project.entries = dictionary[@"Entries Array"];
    return project;
}

- (NSDictionary *)entryAsDictionary:(Entry *)entry {
    NSDictionary *dictionary = @{@"start time" : entry.startTime, @"end time" : entry.endTime, @"name" : entry.name};
    return dictionary;
}

- (Entry *)entryFromDictionary:(NSDictionary *)dictionary {
    Entry *entry = [[Entry alloc] init];
    entry.startTime = dictionary[@"start time"];
    entry.endTime = dictionary[@"end time"];
    entry.name = dictionary[@"name"];
    return entry;
}

- (void) saveProjects {
    NSMutableArray *arrayOfProjects = [NSMutableArray new];
    for (Project *i in self.Projects) {
        NSMutableDictionary *arrayOfEntries = [NSMutableDictionary new];
        for (Entry *e in i.entries) {
            [arrayOfEntries addEntriesFromDictionary:[self entryAsDictionary:e]];
        }
            [arrayOfProjects addObject:arrayOfEntries];
    }
    [[NSUserDefaults standardUserDefaults]setObject:arrayOfProjects forKey:@"projects"];
    NSLog(@"Saved project array.");

}

- (void) loadProjects {
    NSArray *projectsArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"projects"];
    NSMutableArray *projects = [NSMutableArray new];
    for (NSArray *i in projectsArray) {
        Project *newProject = [self projectFromDictionary:i];
        
        [projects addObject:newProject];
    }
    self.Projects = projects;
    NSLog(@"Loaded project array.");

}

@end
