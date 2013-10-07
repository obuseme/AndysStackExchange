//
//  User.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/6/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "User.h"
#import <RestKit/RestKit.h>

@implementation User

+ (RKObjectMapping *) objectMapping
{
    RKObjectMapping *questionMapping = [RKObjectMapping mappingForClass:[User class]];
    [questionMapping addAttributeMappingsFromDictionary:@{
                                                          @"user_id" : @"userID",
                                                          @"display_name" : @"displayName",
                                                          }];
    return questionMapping;
}

@end
