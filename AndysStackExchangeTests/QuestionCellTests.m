//
//  QuestionCellTests.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 11/14/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuestionCell+Question.h"
#import "Question.h"

@interface QuestionCellTests : XCTestCase

@end

@implementation QuestionCellTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testUpdateWithQuestion
{
    QuestionCell *toTest = [[QuestionCell alloc] init];
    Question *aQuestion = [[Question alloc] init];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    toTest.titleLabel = titleLabel;
    NSString *aTitle = @"aTitle";
    aQuestion.title = aTitle;

    UILabel *bodyLabel = [[UILabel alloc] init];
    toTest.bodyLabel = bodyLabel;
    NSString *aBody = @"aBody";
    aQuestion.body = aBody;

    UILabel *scoreLabel = [[UILabel alloc] init];
    toTest.scoreLabel = scoreLabel;
    NSString *aScore = @"aScore";
    aQuestion.score = aScore;

    UILabel *answerCountLabel = [[UILabel alloc] init];
    toTest.answerCountLabel = answerCountLabel;
    NSString *aAnswerCount = @"aAnswerCount";
    aQuestion.answerCount = aAnswerCount;

    UILabel *viewCountLabel = [[UILabel alloc] init];
    toTest.viewCountLabel = viewCountLabel;
    NSString *aViewCount = @"aViewCount";
    aQuestion.viewCount = aViewCount;
    NSString *formattedViewCount= [NSString stringWithFormat:@"%@ views", aViewCount];

    [toTest updateWithQuestion:aQuestion];
    

    XCTAssertTrue([aTitle isEqualToString:toTest.titleLabel.text], @"");
    XCTAssertTrue([aBody isEqualToString:toTest.bodyLabel.text], @"");
    XCTAssertTrue([aScore isEqualToString:toTest.scoreLabel.text], @"");
    XCTAssertTrue([aAnswerCount isEqualToString:toTest.answerCountLabel.text], @"");
    XCTAssertTrue([formattedViewCount isEqualToString:toTest.viewCountLabel.text], @"");
}

@end
