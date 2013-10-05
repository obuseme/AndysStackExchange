//
//  RestKitUtils.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/5/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "RestKitUtils.h"
#import <RestKit/RestKit.h>

@implementation RestKitUtils

/**
 Initializes the shared RKObjectManager instance
 */
+ (void) initializeObjectManager
{
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    NSURL *baseURL = [NSURL URLWithString:@"https://api.stackexchange.com"];
    AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    //we want to work with JSON-Data
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    
    // Initialize RestKit
    [[RKObjectManager alloc] initWithHTTPClient:client];
}

@end
