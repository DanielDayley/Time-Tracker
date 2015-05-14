//
//  DetailViewController.m
//  Time-Tracker
//
//  Created by Daniel Dayley on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewDataSource.h"
#import "Project.h"

@interface DetailViewController ()
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
