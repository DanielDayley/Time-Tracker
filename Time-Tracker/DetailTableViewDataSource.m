//
//  DetailTableViewController.m
//  Time-Tracker
//
//  Created by Daniel Dayley on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailTableViewDataSource.h"

@interface DetailTableViewDataSource ()

@end

@implementation DetailTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.project.Entries count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    Entry *entry = self.project.Entries[indexPath.row];
    NSString *label = [NSString stringWithFormat:@"%@ %@", entry.StartTime, entry.EndTime];
    entry.Name = label;
    return cell;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
