//
//  MasterViewController+private.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/3/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "MasterViewController+private.h"
#import "Question.h"

@implementation MasterViewController (private)

- (NSString *) getTitleForObject:(NSArray *) objects atIndex:(int)index
{
    Question *aQ = objects[index];
    return aQ.title;
}

@end
