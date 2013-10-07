//
//  ProvileViewController.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/6/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "ProfileViewController.h"
#import "User.h"

@interface ProfileViewController () {
    UserAPI *userAPI;
}

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    userAPI = [[UserAPI alloc] init];
    userAPI.delegate = self;
    [userAPI loadUser:self.userIdToShow];
    self.title = @"User Profile";
}

- (void) userLoaded:(User *)user
{
    self.displayNameLabel.text = user.displayName;
    self.repTitleLabel.hidden = NO;
    self.repLabel.hidden = NO;
    self.repLabel.text = user.rep;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
