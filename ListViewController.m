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
    // Do any additional setup after loading the view.
    
    self.DataSource = [[ListTableViewDatasource alloc] init];
    self.Frank = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    self.Frank.dataSource = self.DataSource;
    self.Frank.delegate = self;
    
    [self.view addSubview:self.Frank];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Project *project = [ProjectController sharedInstance].Projects[indexPath.row];
    
    DetailViewController *viewController = [DetailViewController new];
    
    viewController.Project = project;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
