//
//  DetailViewController.m
//  Time-Tracker
//
//  Created by Daniel Dayley on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewDataSource.h"
#import "CustomEntryViewController.h"
#import "ProjectController.h"
#import "Project.h"
@import MessageUI;

@interface DetailViewController () <MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *checkInButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *checkOutButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reportButton;
@end

@implementation DetailViewController

-(instancetype)init {
    self = [super init];
    DetailTableViewDataSource *dataSource = [DetailTableViewDataSource  new];
    dataSource.project = self.Project;
    self.dataSource = dataSource;
    self.detailTableView.dataSource = self.dataSource;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource.project = self.Project;
}

- (IBAction)titleTextFieldText:(id)sender {
    self.titleTextField.placeholder = self.titleTextField.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.titleTextField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    self.Project.name = self.titleTextField.text;
    [[ProjectController sharedInstance] saveProjects];
}

- (IBAction)addButtonPressed:(id)sender {
    CustomEntryViewController *customEntryController = [CustomEntryViewController new];
    customEntryController.project = self.Project;
    customEntryController.dataSource = self.dataSource;
    [self presentViewController:customEntryController animated:YES completion:nil];
    [self.detailTableView reloadData];
}

- (IBAction)checkInPressed:(id)sender {
    [self.Project startNewEntry];
    [self.detailTableView reloadData];
    [[ProjectController sharedInstance] saveProjects];
}

- (IBAction)checkOutPressed:(id)sender {
    [self.Project endCurrentEntry];
    [self.detailTableView reloadData];
    [[ProjectController sharedInstance] saveProjects];
}

- (IBAction)reportPressed:(id)sender {
    MFMailComposeViewController *mailVC = [MFMailComposeViewController new];
    mailVC.mailComposeDelegate = self;
    NSString *string = @"";
    for (Entry *i in self.Project.entries) {
        NSString *startString = [NSString stringWithFormat:@"%@",i.startTime];
        NSString *endString = [NSString stringWithFormat:@"%@",i.endTime];
        NSString *finalString = [NSString stringWithFormat:@"%@\n%@\n",startString,endString ];
        string = [NSString stringWithFormat:@"%@ %@", string, finalString];
    }
    [mailVC setMessageBody:string isHTML:NO];
    [self presentViewController:mailVC animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
