//
//  AppDelegate.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/23/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "AppDelegate.h"
#import "RestKitUtils.h"
#import "MasterViewController.h"
#import "StackExchangeAuthenticator.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    [RestKitUtils initializeObjectManager];
    self.mvc = (MasterViewController *)((UINavigationController *)self.window.rootViewController).topViewController;
    [[StackExchangeAuthenticator sharedAuthenticator] authenticate:^(NSString *accessToken, NSString *error, NSString *errorDescription) {
        if (accessToken == nil) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error authenticating"
                                                            message:errorDescription
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else {
            NSLog(@"successfully auth'd");
        }
    }];
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    NSLog(@"hi");
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    [self.mvc loadItems];
    completionHandler(UIBackgroundFetchResultNoData);
    NSLog(@"Performed fetch at %@", [NSDate date]);
}

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler
{
    NSLog(@"handleEventsForBackgroundURLSession");
}

- (void) loadData:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    [[delegateFreeSession dataTaskWithURL: [NSURL URLWithString: @"https://api.stackexchange.com/2.1/questions?order=desc&sort=creation&site=stackoverflow&tagged=iphone"]
                        completionHandler:^(NSData *data, NSURLResponse *response,
                                            NSError *error) {
                            NSLog(@"Got response %@ with error %@.\n", response, error);
//                            NSLog(@"DATA:\n%@\nEND DATA\n", [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding]);
                            
                            NSError *e = nil;
                            id json = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
                            self.posts = [json objectForKey:@"questions"];
    
                            [[NSNotificationCenter defaultCenter] postNotificationName:@"DataRefreshed" object:nil];
                            
                            
                            if (completionHandler) completionHandler(UIBackgroundFetchResultNewData);
                        }] resume];

}

@end
