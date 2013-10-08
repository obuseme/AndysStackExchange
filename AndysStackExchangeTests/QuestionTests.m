//
//  QuestionTests.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/7/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Question.h"
#import <RestKit/RestKit.h>

@interface QuestionTests : XCTestCase

@end

@implementation QuestionTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testObjectMapping
{
    NSArray *sourceKeyPaths = @[@"question_id", @"title", @"body", @"score"];
    NSArray *destinationKeyPaths = @[@"questionID", @"title", @"body", @"score"];
    RKObjectMapping *mapping = [Question objectMapping];
    NSArray *mappings = mapping.propertyMappings;
    for (RKPropertyMapping *mapping in mappings) {
        XCTAssertTrue([sourceKeyPaths containsObject:mapping.sourceKeyPath], @"source key path for Question is wrong");
        XCTAssertTrue([destinationKeyPaths containsObject:mapping.destinationKeyPath], @"destination key path for Question is wrong");
    }
}

@end
