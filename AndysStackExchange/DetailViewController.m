//
//  DetailViewController.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/23/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () {
    UIDynamicAnimator *a;
}
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem objectForKey:@"title"];
    }

    a = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *g = [[UIGravityBehavior alloc] initWithItems:@[self.detailDescriptionLabel]];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.detailDescriptionLabel]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [a addBehavior:g];
    [a addBehavior:collisionBehavior];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)snap:(id)sender
{
    UISnapBehavior *s = [[UISnapBehavior alloc] initWithItem:self.detailDescriptionLabel snapToPoint:self.view.center];
    [a addBehavior:s];
}

@end
