//
//  LagTableViewController.m
//  Lag
//
//  Created by Jason Ji on 9/28/15.
//  Copyright © 2015 Jason Ji. All rights reserved.
//

#import "LagTableViewController.h"

@interface LagTableViewController ()

@property (strong, nonatomic) NSArray *insertOrReload;

@end

@implementation LagTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.insertOrReload = @[@YES, @NO, @NO, @NO, @NO, @NO, @NO];
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    for(NSInteger i = 0; i < 7; i++) {
        if([self.insertOrReload[i] boolValue]) {
            if(editing)
                [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:i]] withRowAnimation:UITableViewRowAnimationFade];
            else
                [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:i]] withRowAnimation:UITableViewRowAnimationFade];
        }
        else
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:i] withRowAnimation:UITableViewRowAnimationFade];

    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.editing)
        return [self.insertOrReload[section] boolValue] ? 2 : 1;
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Lag";
}

@end
