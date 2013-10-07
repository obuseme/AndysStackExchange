//
//  Question.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/5/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Items, RKObjectMapping, User;

/**
 Represents a "question" as posted on stackoverflow.com
 
 https://api.stackexchange.com/docs/questions
 */
@interface Question : NSObject

/**
 Question id
 */
@property (nonatomic, copy) NSString *questionID;

/**
 Title of the question
 */
@property (nonatomic, copy) NSString *title;

/**
 Body text of the question, includes markdown
 */
@property (nonatomic, copy) NSString *body;

/**
 Current score for the question
 */
@property (nonatomic, copy) NSString *score;

/**
 The User who asked the question
 */
@property (nonatomic, strong) User *owner;

/**
 Provides the `RKObjectMapping` for mapping the REST resource through RestKit
 */
+ (RKObjectMapping *) objectMapping;

@end
