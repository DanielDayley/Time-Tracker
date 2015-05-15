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
    self.dataSource = dataSource;
    self.detailTableView.dataSource = self.dataSource;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.dataSource.project = self.Project;
}
- (IBAction)titleTextFieldText:(id)sender {
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.titleTextField resignFirstResponder];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
    Project *newProject = [[Project alloc] init];
    Entry *name;
    name.Name = self.titleTextField.text;
    [newProject AddEntry:name];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addButtonPressed:(id)sender {
    CustomEntryViewController *customEntryController = [CustomEntryViewController new];
    customEntryController.project = self.Project;
    [self presentViewController:customEntryController animated:YES completion:nil];
}
- (IBAction)checkInPressed:(id)sender {
    [self.Project startNewEntry];
    [self.detailTableView reloadData];
    
}
- (IBAction)checkOutPressed:(id)sender {
    [self.Project endCurrentEntry];
    [self.detailTableView reloadData];
}
- (IBAction)reportPressed:(id)sender {
    MFMailComposeViewController *mailVC = [MFMailComposeViewController new];
    mailVC.mailComposeDelegate = self;
    NSString *string = @"";
    for (Entry *i in self.Project.Entries) {
        NSString *startString = [NSString stringWithFormat:@"%@",i.StartTime];
        NSString *endString = [NSString stringWithFormat:@"%@",i.EndTime];
        NSString *finalString = [NSString stringWithFormat:@"%@\n%@\n",startString,endString ];
        string = [NSString stringWithFormat:@"%@ %@", string, finalString];
    }
    [mailVC setMessageBody:string isHTML:NO];
    [self presentViewController:mailVC animated:YES completion:nil];
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
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
