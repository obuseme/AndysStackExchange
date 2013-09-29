//
//  MyBackgroundDelegate.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/24/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionHandlerType)();

@interface MyBackgroundDelegate : NSObject <NSURLSessionDelegate>

@property NSMutableDictionary *completionHandlerDictionary;
@property NSURLSession *backgroundSession;

- (void) addCompletionHandler: (CompletionHandlerType) handler forSession: (NSString *)identifier;
- (void) callCompletionHandlerForSession: (NSString *)identifier;
- (void) setup;

@end
