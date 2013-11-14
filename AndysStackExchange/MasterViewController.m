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
#import "ProfileViewController.h"

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

/**
 Dynamically calculates the height for the row based on the current font size selected by the user in iOS7 settings.
 */
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    //First: Convert the NSString to an NSAttributed string with the right font
//    NSString *titleString = [self getTitleForObject:items atIndex:indexPath.row];
//    UIFont *titleLabelFont =[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
//    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:titleString attributes:@{NSFontAttributeName: titleLabelFont}];
//    
//    //Second: Get CGRect that bounds the string.  Use the max float for the height because we want to determine how tall it is
//    //Ya, 272 as a hard coded width is bad here, consider improving to dynamically get the current width of the label in this orientation
//    CGRect rect = [attributedText boundingRectWithSize:(CGSize){272, CGFLOAT_MAX}
//                                               options:NSStringDrawingUsesLineFragmentOrigin
//                                               context:nil];
//
//    //Finally: Add padding to the height and return it!
//    CGFloat PADDING_OUTER = 10;
//    CGFloat totalHeight = [self heightWithPadding:rect paddingToAdd:PADDING_OUTER];
//
//    return totalHeight;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    [self configureCell:cell atIndexPath:indexPath fromObjects:items];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *dvc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [self prepareDetailControllerForSegue:dvc indexPath:indexPath questions:items];
    } else if ([[segue identifier] isEqualToString:@"showAndysProfile"]) {
        ProfileViewController *pvc = [segue destinationViewController];
        pvc.userIdToShow = @"209867";
    }
}

@end
