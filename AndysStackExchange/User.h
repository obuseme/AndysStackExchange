//
//  User.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/6/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectMapping;

/**
 Represents a "user" on stackoverflow.com
 
 https://api.stackexchange.com/docs/users
 */
@interface User : NSObject

/**
 User id
 */
@property (nonatomic, copy) NSString *userID;

/**
 Display name of the user
 */
@property (nonatomic, copy) NSString *displayName;

/**
 Current reputation for the user
 */
@property (nonatomic, copy) NSString *rep;

/**
 Provides the `RKObjectMapping` for mapping the REST resource through RestKit
 */
+ (RKObjectMapping *) objectMapping;

@end
