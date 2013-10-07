//
//  Question.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/5/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Items, RKObjectMapping;

@interface Question : NSObject

@property (nonatomic, copy) NSString *questionID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *score;

+ (RKObjectMapping *) objectMapping;

@end
