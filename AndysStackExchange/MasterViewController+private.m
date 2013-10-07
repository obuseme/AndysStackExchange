//
//  MasterViewController+private.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/3/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "MasterViewController+private.h"
#import "Question.h"
#import "DetailViewController.h"

@implementation MasterViewController (private)

- (NSArray *) getItems
{
    return items;
}

- (NSString *) getTitleForObject:(NSArray *) objects atIndex:(int)index
{
    Question *aQ = objects[index];
    return aQ.title;
}

- (CGFloat)heightWithPadding:(CGRect)rect paddingToAdd:(CGFloat) padding {
    CGFloat totalHeight = padding + ceilf(rect.size.height) + padding;
    return totalHeight;
}

- (void) prepareDetailControllerForSegue:(DetailViewController *) dvc indexPath:(NSIndexPath *) indexPath questions:(NSArray *)questions
{
    [dvc setQuestion:questions[indexPath.row]];
}

- (void) configureLabelForTitle:(UILabel *) titleLabel atIndexPath:(NSIndexPath *) indexPath fromItems:(id)newItems
{
    titleLabel.text = [self getTitleForObject:newItems atIndex:indexPath.row];
    titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)preferredContentSizeChanged:(NSNotification *)notification {
    [self.tableView reloadData];
}

@end
