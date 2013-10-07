//
//  UsersAPI.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/6/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@protocol UserAPIDelegate;

/**
 Central API for interacting with the /users related REST resources on the stackoverflow API
 
 https://api.stackexchange.com/docs/users
 */
@interface UserAPI : NSObject

@property (weak) id<UserAPIDelegate> delegate;

/**
 Loads the detailed information for the specified user from the remote resource.  Upon completion the delegate method is called to pass the `User` object to the delegate.
 
 @param userId The user id for the user's profile to load
 */
- (void) loadUser:(NSString *) userId;

@end

@protocol UserAPIDelegate <NSObject>
@required
/**
 Message sent to the delegate once the user information has loaded.
 
 @param The user that was loaded
 */
- (void) userLoaded:(User *)user;
@end