//
//  ProvileViewController.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/6/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserAPI.h"

@class User;

/**
 Handles showing the profile information for a user on stackexchange.com
 
 Controller will attempt to load the detailed information for the specified 
 userId
 */
@interface ProfileViewController : UIViewController <UserAPIDelegate>

@property (nonatomic, strong) IBOutlet UILabel *displayNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *repTitleLabel;
@property (nonatomic, strong) IBOutlet UILabel *repLabel;
@property (nonatomic, strong) NSString *userIdToShow;

@end
