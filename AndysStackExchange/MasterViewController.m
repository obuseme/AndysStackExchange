//
//  MasterViewController.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/23/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "MasterViewController.h"
#import "MasterViewController+private.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "Question.h"

@interface MasterViewController () {
    NSArray *items;
    ItemsAPI *itemsAPI;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    itemsAPI = [[ItemsAPI alloc] init];
    itemsAPI.delegate = self;
    [itemsAPI loadItems];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) itemsLoaded:(NSArray *)pItems
{
    items = pItems;
    [self.tableView reloadData];
}

- (void) dataRefreshed:(NSNotification *) notification
{
    items = ((AppDelegate *)[UIApplication sharedApplication].delegate).posts;
    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.textLabel.text = [self getTitleForObject:items atIndex:indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Question *q = items[indexPath.row];
        [[segue destinationViewController] setQuestion:q];
    }
}

@end
