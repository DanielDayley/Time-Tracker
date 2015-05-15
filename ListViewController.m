//
//  ListViewController.m
//  Time-Tracker
//
//  Created by Justin Oakes on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"

@interface ListViewController ()
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.DataSource = [[listTableViewDatasource alloc] init];
    self.listTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.listTableView.dataSource = self.DataSource;
    self.listTableView.delegate = self;
    [self.view addSubview:self.listTableView];
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addProject)];
    self.navigationItem.rightBarButtonItem = addButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Project *project = [ProjectController sharedInstance].Projects[indexPath.row];
    DetailViewController *detailViewController = [DetailViewController new];
    detailViewController.Project = project;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)addProject {
    Project *project = [ProjectController sharedInstance].Projects[[ProjectController sharedInstance].Projects.count];
    DetailViewController *detailViewController = [DetailViewController new];
    detailViewController.Project = project;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
