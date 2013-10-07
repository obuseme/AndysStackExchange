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


- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredContentSizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    [self configureView];
    
    [super viewDidLoad];
}

- (void)preferredContentSizeChanged:(NSNotification *)notification {
    self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

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
    if (self.question) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.titleLabel.text = self.question.title;
        self.bodyLabel.text = self.question.body;
        self.questionScoreLabel.text = self.question.score;

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
