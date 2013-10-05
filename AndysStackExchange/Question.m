//
//  Question.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/5/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "Question.h"
#import <RestKit/RestKit.h>

@implementation Question


+ (RKObjectMapping *) objectMapping
{
    
    //        RKObjectMapping *itemsMapping = [RKObjectMapping mappingForClass:[Items class]];
    //        [itemsMapping addAttributeMappingsFromDictionary:@{
    //                                                          @"items" : @"items",
    //                                                          }];
    
    
    RKObjectMapping *questionMapping = [RKObjectMapping mappingForClass:[Question class]];
    [questionMapping addAttributeMappingsFromDictionary:@{
                                                          @"question_id" : @"questionID",
                                                          @"title" : @"title",
                                                          }];
    return questionMapping;
}

@end
