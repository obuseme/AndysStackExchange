//
//  RestKitUtils.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/5/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Convenience class with methods to help manage RestKit related things.
 */
@interface RestKitUtils : NSObject

/**
 Initializes the shared RKObjectManager instance
 */
+ (void) initializeObjectManager;

@end
