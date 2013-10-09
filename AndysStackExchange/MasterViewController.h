//
//  MasterViewController.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/23/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemsAPI.h"

/**
 The initial controller visible when viewing the application.  Shows a list of questions from stackexchange.com and
 allows a user to select one to view details about the question.
 */
@interface MasterViewController : UIViewController <ItemsAPIDelegate> {
    NSArray *items;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (void) loadItems;

@end
