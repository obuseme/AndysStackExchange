//
//  MyBackgroundDelegate.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/24/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "MyBackgroundDelegate.h"

@implementation MyBackgroundDelegate

- (void) setup
{
    NSURLSessionConfiguration *backgroundConfigObject = [NSURLSessionConfiguration backgroundSessionConfiguration: @"myBackgroundSessionIdentifier"];
    self.backgroundSession = [NSURLSession sessionWithConfiguration: backgroundConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
    NSLog(@"Background URL session %@ finished events.\n", session);
    
    if (session.configuration.identifier)
        [self callCompletionHandlerForSession: session.configuration.identifier];
}

- (void) addCompletionHandler: (CompletionHandlerType) handler forSession: (NSString *)identifier
{
    if ([ self.completionHandlerDictionary objectForKey: identifier]) {
        NSLog(@"Error: Got multiple handlers for a single session identifier.  This should not happen.\n");
    }
    
    [ self.completionHandlerDictionary setObject:handler forKey: identifier];
}

- (void) callCompletionHandlerForSession: (NSString *)identifier
{
    CompletionHandlerType handler = [self.completionHandlerDictionary objectForKey: identifier];
    
    if (handler) {
        [self.completionHandlerDictionary removeObjectForKey: identifier];
        NSLog(@"Calling completion handler.\n");
        
        handler();
    }
}

@end
