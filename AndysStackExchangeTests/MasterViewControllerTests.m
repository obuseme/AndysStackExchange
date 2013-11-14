//
//  MasterViewControllerTests.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/3/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MasterViewController.h"
#import "MasterViewController+private.h"
#import "OCMock.h"
#import "Question.h"
#import "DetailViewController.h"

@interface MasterViewControllerTests : XCTestCase {
    MasterViewController *toTest;
}

@end

@implementation MasterViewControllerTests

- (void)setUp
{
    [super setUp];
    toTest = [[MasterViewController alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void) testGetTitleForObject
{
    NSString *sentTitle = @"Andy's Title";
    Question *aQ = [[Question alloc] init];
    aQ.title = sentTitle;
    NSArray *objects = @[aQ];
    NSString *returnedTitle = [toTest getTitleForObject:objects atIndex:0];
    XCTAssertEqual(returnedTitle, sentTitle, @"Sent title did not equal returned title");
}

/**
 Really just verifies that segues for specified identifiers are recognize and handled
 */
- (void) testPrepareForSegue
{
    OCMockObject *mockSegue = [OCMockObject mockForClass:[UIStoryboardSegue class]];
    [[[mockSegue stub] andReturn:@"showDetail"] identifier];
    [[mockSegue expect] destinationViewController];
    
    [toTest prepareForSegue:((UIStoryboardSegue *)mockSegue) sender:nil];
    
    [mockSegue verify];
    

    [[[mockSegue stub] andReturn:@"showAndysProfile"] identifier];
    [[mockSegue expect] destinationViewController];
    
    [toTest prepareForSegue:((UIStoryboardSegue *)mockSegue) sender:nil];
    
    [mockSegue verify];

}

- (void) testAddPaddingToHeight
{
    CGFloat currentHeight = 10;
    CGFloat padding = 5;
    CGRect needsPadding = CGRectMake(0, 0, 10, currentHeight);
    CGFloat newHeight = [toTest heightWithPadding:needsPadding paddingToAdd:padding];
    XCTAssertTrue((currentHeight + padding + padding) == newHeight, @"Height did not get the right amount of padding");
}

- (void) testPrepareDetailControllerForSegue
{
    Question *aQ = [[Question alloc] init];
    NSArray *listOfQs = @[aQ];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    DetailViewController *dvc = [[DetailViewController alloc] init];
    [toTest prepareDetailControllerForSegue:dvc indexPath:indexPath questions:listOfQs];
    XCTAssertEqual(dvc.question, aQ, @"DetailViewController did not have the correct question after preparing it for segue");
}

- (void) testConfigureLabelForTitle
{
    Question *aQ = [[Question alloc] init];
    NSString *aTitle = @"title";
    aQ.title = aTitle;
    NSArray *listOfQs = @[aQ];
    UILabel *aLabel = [[UILabel alloc] init];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [toTest configureLabelForTitle:aLabel atIndexPath:indexPath fromItems:listOfQs];
    NSLog(@"aLabel.text=%@", aLabel.text);
    XCTAssertTrue([aTitle isEqualToString:aLabel.text], @"Label text and title strings should be the same");
    XCTAssertEqual(aLabel.font, [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline], @"Font should be Headline in order to match what is specified in IB");
}

- (void) testNumberOfRowsInSection
{
    int rows = [toTest.tableView numberOfRowsInSection:0];
    XCTAssertTrue(rows == [[toTest getItems] count], @"Number of rows in section should be equal to the number of items");
}

- (void) testViewDidAppear
{
    OCMockObject *mockTable = [OCMockObject mockForClass:[UITableView class]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [[[mockTable stub] andReturn:indexPath] indexPathForSelectedRow];
    [[mockTable expect] deselectRowAtIndexPath:indexPath animated:YES];
    toTest.tableView = ((UITableView *)mockTable);
    [toTest viewDidAppear:YES];
    [mockTable verify];
}

- (void) testPreferredContentSizeChanged
{
    OCMockObject *mockTable = [OCMockObject mockForClass:[UITableView class]];
    [[mockTable expect] reloadData];
    toTest.tableView = ((UITableView *)mockTable);
    [toTest preferredContentSizeChanged:nil];
    [mockTable verify];
}

- (void) testItemsLoaded
{
    Question *aQ = [[Question alloc] init];
    NSString *aTitle = @"title";
    aQ.title = aTitle;
    NSArray *listOfQs = @[aQ];
    [toTest itemsLoaded:listOfQs];
    XCTAssertEqual(listOfQs, [toTest getItems], @"Items provided do not match those on the controller");
}

@end
