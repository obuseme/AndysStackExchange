//
//  AppDelegate.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/23/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyBackgroundDelegate;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MyBackgroundDelegate *backgroundDelegate;

@property (strong, nonatomic) NSArray *posts;

@end
