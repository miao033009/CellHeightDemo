//
//  MasterViewController.m
//  CellHeightDemo
//
//  Created by 张猛 on 15-7-14.
//  Copyright (c) 2015年 Mn. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "DemoTableViewCell.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.estimatedRowHeight = 69;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.objects = [NSMutableArray arrayWithArray:@[@"In the case of topLayoutGuide, the property indicates the highest vertical extent for content that you don't want",
                                                    @"In the case of topLayoutGuide, the property indicates the highest  (such as a status or navigation bar) vertical extent for content that you don't want to appear behind a translucent or transparent UIKit bar .",
                                                    @"In the case of topLayoutGuide",
                                                    @"In the case of topLayoutGuide, the property indicates the highest vertical extent for content that you don't want to appear behind a translucent or transparent UIKit bar (such as a status or navigation bar). So, if your view controller has been pushed onto a UINavigationController stack, topLayoutGuide will tell you how many points from the top of the screen the status bar and navigation bar cover. You can use this value scroll content in a UIScrollView to just below the navigation bar or ensure other content in your view isn't being covered by the UINavigationBar.",
                                                    @"UINavigationController stack, topLayoutGuide will tell you how many points from the top of the screen the status bar and navigation bar cover. You can use this value scroll content in a UIScrollView to just below the navigation bar or ensure other content in your view isn't being covered by the UINavigationBar."
                                                    ]];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *object = self.objects[indexPath.row];
    cell.cellText.text = object;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
