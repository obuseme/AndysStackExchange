//
//  MasterViewController+private.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/3/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "MasterViewController.h"

@class DetailViewController;

/**
 Pseudo-private methods for the MasterViewController.  Provided through this header and implementation to support unit testing.
 @see MasterViewControllerTests
 */
@interface MasterViewController (private)

/**
 @return The items being shown on the view
 */
- (NSArray *) getItems;
/**
 @param objects The `NSArray` of objects to retrieve from
 @param index The index of object to get the title of
 @return The title for the requested object
 */
- (NSString *) getTitleForObject:(NSArray *) objects atIndex:(int)index;
/**
 @param rect A `CGRect` to add padding to the height
 @param padding The amount of padding to add to the top and bottom
 @return The height of the sent `CGRect` with padding added to the top and bottom
 */
- (CGFloat) heightWithPadding:(CGRect)rect paddingToAdd:(CGFloat) padding;
/**
 Prepares the `DetailViewController` for segue'ing
 
 @param dvc The controller to prep for segue'ing
 @param indexPath The selected indexPath in the main screen
 @param questions List of questions to select from
 */
- (void) prepareDetailControllerForSegue:(DetailViewController *) dvc indexPath:(NSIndexPath *) indexPath questions:(NSArray *)questions;
/**
 Configures a `UILabel` for showing the title of an item at a given indexPath
 @param titleLabel The label to prepare
 @param indexPath The index path of the label
 @param items The items to populate the label from
 */
- (void) configureLabelForTitle:(UILabel *) titleLabel atIndexPath:(NSIndexPath *) indexPath fromItems:items;
/**
 Method called when user changes their preferred font size in iOS7 settings.  Does the necessary stuff to make the view look correct.
 */
- (void) preferredContentSizeChanged:(NSNotification *)notification;

@end
