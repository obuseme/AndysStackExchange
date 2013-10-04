//
//  MasterViewControllerTests.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/3/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MasterViewController.h"
#import "OCMock.h"

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

- (void) testPrepareForSegue
{
//    OCMockObject *mockSegue = [OCMockObject mockForClass:[UIStoryboardSegue class]];
//    [[[mockSegue stub] andReturn:@"showDetail"] identifier];
//    [[mockSegue expect] destinationViewController];
//    
//    [toTest prepareForSegue:((UIStoryboardSegue *)mockSegue) sender:nil];
//    
//    [mockSegue verify];
}

@end
