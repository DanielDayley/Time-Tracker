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
    
    return [self.project.entries count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    Entry *entry = self.project.entries[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", entry.startTime, entry.endTime];
    return cell;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
