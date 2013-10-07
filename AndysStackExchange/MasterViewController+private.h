//
//  MasterViewController+private.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/3/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "MasterViewController.h"

@class DetailViewController;

@interface MasterViewController (private)

- (NSArray *) getItems;
- (NSString *) getTitleForObject:(NSArray *) objects atIndex:(int)index;
- (CGFloat)heightWithPadding:(CGRect)rect paddingToAdd:(CGFloat) padding;
- (void) prepareDetailControllerForSegue:(DetailViewController *) dvc indexPath:(NSIndexPath *) indexPath questions:(NSArray *)questions;
- (void) configureLabelForTitle:(UILabel *) titleLabel atIndexPath:(NSIndexPath *) indexPath fromItems:items;
- (void)preferredContentSizeChanged:(NSNotification *)notification;

@end
