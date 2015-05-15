//
//  CustomEntryViewController.h
//  Time-Tracker
//
//  Created by Daniel Dayley on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"
#import "DetailTableViewDataSource.h"
@interface CustomEntryViewController : UIViewController
@property (strong, nonatomic) Project *project;
@property (strong, nonatomic) DetailTableViewDataSource *dataSource;
@end
