//
//  RestKitUtils.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/5/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "RestKitUtils.h"
#import <RestKit/RestKit.h>
#import "User.h"
#import "Question.h"

@implementation RestKitUtils

+ (void) initializeObjectManager
{
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    NSURL *baseURL = [NSURL URLWithString:@"https://api.stackexchange.com"];
    AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    // Initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];

}

@end
