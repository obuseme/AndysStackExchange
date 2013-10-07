//
//  UsersAPI.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/6/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "UserAPI.h"
#import <RestKit/RestKit.h>
#import "User.h"

@implementation UserAPI

- (void) loadUser:(NSString *) userId
{
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    //Possible opportunity to refactor setting the responseDescriptor out to when the RKObjectManager is initialized
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[User objectMapping]
                                                                                            method:RKRequestMethodGET
                                                                                       pathPattern:nil
                                                                                           keyPath:@"items"
                                                                                       statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];

    [objectManager getObjectsAtPath:[NSString stringWithFormat:@"/2.1/users/%@?site=stackoverflow", userId]
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                [self.delegate userLoaded:[[[mappingResult dictionary] objectForKey:@"items" ] objectAtIndex:0]];
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
