//
//  ListTableViewDatasource.m
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListTableViewDatasource.h"

@implementation ListTableViewDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = @"I am a label for Frank";
    
    return cell;
    
}


@end
