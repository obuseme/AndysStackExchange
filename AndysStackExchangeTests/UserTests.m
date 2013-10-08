//
//  UserTests.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/7/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "User.h"
#import <RestKit/RestKit.h>

@interface UserTests : XCTestCase

@end

@implementation UserTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testObjectMapping
{
    NSArray *sourceKeyPaths = @[@"user_id", @"display_name", @"reputation"];
    NSArray *destinationKeyPaths = @[@"userID", @"displayName", @"rep"];
    RKObjectMapping *mapping = [User objectMapping];
    NSArray *mappings = mapping.propertyMappings;
    for (RKPropertyMapping *mapping in mappings) {
        XCTAssertTrue([sourceKeyPaths containsObject:mapping.sourceKeyPath], @"source key path for User is wrong");
        XCTAssertTrue([destinationKeyPaths containsObject:mapping.destinationKeyPath], @"destination key path for User is wrong");
    }
}

@end
