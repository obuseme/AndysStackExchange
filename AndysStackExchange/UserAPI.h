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

@interface UserAPI : NSObject

@property (weak) id<UserAPIDelegate> delegate;

- (void) loadUser:(NSString *) userId;

@end

@protocol UserAPIDelegate <NSObject>
@required
- (void) userLoaded:(User *)user;
@end