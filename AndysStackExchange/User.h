//
//  User.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/6/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectMapping;

@interface User : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *displayName;

+ (RKObjectMapping *) objectMapping;

@end
