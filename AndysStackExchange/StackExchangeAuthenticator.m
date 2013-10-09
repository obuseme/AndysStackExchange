//
//  StackExchangeAuthorizationUtils.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/8/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "StackExchangeAuthenticator.h"
#import "Constants.h"

@implementation StackExchangeAuthenticator

+ (StackExchangeAuthenticator *)sharedAuthenticator
{
    //static keyword creates one shared instance of this variable for anyone who calls this method
    static StackExchangeAuthenticator *sharedAuthenticator = nil;
    static dispatch_once_t oncePredicate;
    //use GCD to execute this block of code once
    dispatch_once(&oncePredicate, ^{
        sharedAuthenticator = [[StackExchangeAuthenticator alloc] init];
    });
    
    return sharedAuthenticator;
}

- (BOOL) isAuthenticated
{
    return NO;
}

- (void) authenticate:(StackExchangeAuthenticatorCallback)completionBlock
{
    if ([self getAccessToken] == nil) {
        NSString *url = [NSString stringWithFormat:@"%@/%@?client_id=%@&scope=%@&redirect_uri=%@",
                         API_URL,
                         @"dialog",
                         [NSNumber numberWithInt:CLIENT_ID],
                         SCOPE,
                         REDIRECT_URI];
        NSLog(@"url=%@", url);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    } else {
        completionBlock([self getAccessToken], nil, nil);
    }
}

- (void)saveAccessToken:(NSString *)accessToken
{
    [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:@"accessToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)getAccessToken
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"accessToken"];
}

- (void)clearAccessToken
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"accessToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
