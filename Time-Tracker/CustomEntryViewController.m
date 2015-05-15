//
//  CustomEntryViewController.m
//  Time-Tracker
//
//  Created by Daniel Dayley on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CustomEntryViewController.h"
#import "Entry.h"

@interface CustomEntryViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *startDatePickerDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDatePickerDate;

@end

@implementation CustomEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)saveButtonPressed:(id)sender {
    Entry *newEntry = [Entry new];
    newEntry.startTime = self.startDatePickerDate.date;
    newEntry.endTime = self.endDatePickerDate.date;
    [self.project AddEntry:newEntry];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonPressed:(id)sender {
        [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
