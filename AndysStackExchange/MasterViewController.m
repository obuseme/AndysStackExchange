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
#import "QuestionCell.h"

@interface MasterViewController () {
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredContentSizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
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

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *titleString = [self getTitleForObject:items atIndex:indexPath.row];
    UIFont *titleLabelFont =[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:titleString attributes:@{NSFontAttributeName: titleLabelFont}];
    
    //Ya, 272 as a hard coded width is bad here, consider improving to dynamically get the current width of the label in this orientation
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){272, CGFLOAT_MAX}
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];

    CGFloat PADDING_OUTER = 10;
    CGFloat totalHeight = [self heightWithPadding:rect paddingToAdd:PADDING_OUTER];

    return totalHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    [self configureLabelForTitle:cell.titleLabel atIndexPath:indexPath fromItems:items];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *dvc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [self prepareDetailControllerForSegue:dvc indexPath:indexPath questions:items];
    }
}

@end
