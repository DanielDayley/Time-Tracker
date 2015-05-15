//
//  ListViewController.h
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listTableViewDatasource.h"

@interface ListViewController : UIViewController <UITableViewDelegate>

@property (strong, nonatomic) listTableViewDatasource *DataSource;

@property (strong, nonatomic) UITableView *listTableView;

@end
