//
//  DetailViewController.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/23/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "DetailViewController.h"
#import "Question.h"

@interface DetailViewController () {
    UIDynamicAnimator *a;
}
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setQuestion:(Question *)newQuestion
{
    if (_question != newQuestion) {
        _question = newQuestion;
        
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.question) {
        self.detailDescriptionLabel.text = self.question.title;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)snap:(id)sender
{
    UISnapBehavior *s = [[UISnapBehavior alloc] initWithItem:self.detailDescriptionLabel snapToPoint:self.view.center];
    [a addBehavior:s];
}

@end
