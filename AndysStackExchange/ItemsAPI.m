//
//  ItemsAPI.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/5/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "ItemsAPI.h"
#import "Question.h"
#import <RestKit/RestKit.h>

@implementation ItemsAPI

- (void) loadItems
{
    RKObjectManager *objectManager = [RKObjectManager sharedManager];

    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[Question objectMapping]
                                                                                            method:RKRequestMethodGET
                                                                                       pathPattern:nil
                                                                                           keyPath:@"items"
                                                                                       statusCodes:[NSIndexSet indexSetWithIndex:200]];

    
    [objectManager addResponseDescriptor:responseDescriptor];

    
    [objectManager getObjectsAtPath:@"/2.1/questions?order=desc&sort=creation&site=stackoverflow&tagged=iphone&filter=withbody"
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                NSLog(@"success");
                                [self.delegate itemsLoaded:[[mappingResult dictionary] objectForKey:@"items" ]];
                            }
                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                message:[error localizedDescription]
                                                                               delegate:nil
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil];
                                [alert show];
                                NSLog(@"Hit error: %@", error);
                            }];
}

@end
