//
//  StackExchangeAuthorizationUtils.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/8/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^StackExchangeAuthenticatorCallback)(NSString *accessToken,
                                     NSString *error,
                                     NSString *errorDescription);

@interface StackExchangeAuthenticator : NSObject

+ (StackExchangeAuthenticator *)sharedAuthenticator;
- (void) authenticate:(StackExchangeAuthenticatorCallback)completionBlock;
- (void) clearAccessToken;
- (NSString *) getAccessToken;

@end
