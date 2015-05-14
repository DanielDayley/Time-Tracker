//
//  DetailViewController.h
//  Time-Tracker
//
//  Created by Daniel Dayley on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTableViewDataSource.h"
@interface DetailViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong)DetailTableViewDataSource *dataSource;
@end
