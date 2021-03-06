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
#import "User.h"

@implementation ItemsAPI

- (void) loadItems
{
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    RKObjectMapping *itemsMapping = [Question objectMapping];
    [itemsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"owner" toKeyPath:@"owner" withMapping:[User objectMapping]]];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:itemsMapping
                                                                                            method:RKRequestMethodGET
                                                                                       pathPattern:nil
                                                                                           keyPath:@"items"
                                                                                       statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    //Possible opportunity to refactor setting the responseDescriptor out to when the RKObjectManager is initialized
    [objectManager addResponseDescriptor:responseDescriptor];
    
    [objectManager getObjectsAtPath:@"/2.1/questions?order=desc&sort=creation&site=stackoverflow&tagged=iphone&filter=withbody"
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                [self.delegate itemsLoaded:[[mappingResult dictionary] objectForKey:@"items" ]];
                                [objectManager removeResponseDescriptor:responseDescriptor];
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
