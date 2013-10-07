//
//  MasterViewController.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/23/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemsAPI.h"

@interface MasterViewController : UIViewController <ItemsAPIDelegate> {
    NSArray *items;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
