//
//  ListTableViewDatasource.m
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListTableViewDatasource.h"
#import "ProjectController.h"

@implementation ListTableViewDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[ProjectController sharedInstance].Projects count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    
    Project *project = [ProjectController sharedInstance].Projects[indexPath.row];
    NSString *currentProjectName = project.name;
    cell.textLabel.text = currentProjectName;
    
    return cell;
    
}


@end
