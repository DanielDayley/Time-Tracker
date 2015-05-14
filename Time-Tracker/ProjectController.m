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
    });
    return sharedInstance;
}

-(void) AddProject:(Project *)project {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.Projects];
    
    [array addObject:project];
    
    self.Projects = array;
}

-(void) RemoveProject:(Project *)project{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.Projects];
    
    for (Project *i in array) {
        if ([i isEqual:project]) {
            [array removeObject:i];
        }
    }
    self.Projects = array;
}

- (NSDictionary *) ProjectAsDictionary:(Project *)project {
    
    NSDictionary *dictionary = @{@"Entries Array" : project.Entries};
    
    return dictionary;
}

-(Project *)ProjectFromDictionary:(NSDictionary *)dictionary {
    Project *project = [[Project alloc] init];
    
    project.Entries = dictionary[@"Entries Array"];
    
    return project;
}

-(NSDictionary *)EntreyAsDictionary:(Entry *)entry {
    NSDictionary *dictionary = @{@"start time" : entry.StartTime, @"end time" : entry.EndTime, @"name" : entry.Name};
    
    return dictionary;
    
}

-(Entry *)EntryFromDictionary:(NSDictionary *)dictionary {
    Entry *entry = [[Entry alloc] init];
    
    entry.StartTime = dictionary[@"start time"];
    entry.EndTime = dictionary[@"end time"];
    entry.Name = dictionary[@"name"];
    
    return entry;
}

-(void) saveProjects {
    NSMutableArray *array = [NSMutableArray new];
    
    for (Project *i in self.Projects) {
        NSDictionary *dictionary = [self ProjectAsDictionary:i];
        [array addObject:dictionary];
    }
    [[NSUserDefaults standardUserDefaults]setObject:array forKey:@"projects"];
}

-(void) loadProject{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"projects"];
    NSMutableArray *projects = [NSMutableArray new];
    
    for (NSDictionary *i in array) {
        Project *newProject = [self ProjectFromDictionary:i];
        
        [projects addObject:newProject];
    }
    self.Projects = projects;
}

@end
