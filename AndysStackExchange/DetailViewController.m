//
//  DetailViewController.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/23/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "DetailViewController.h"
#import "Question.h"
#import "User.h"
#import "ProfileViewController.h"

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
    self.title = @"Question";
    if (self.question) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.titleLabel.text = self.question.title;
        self.bodyLabel.text = self.question.body;
        self.bodyLabel.preferredMaxLayoutWidth = 215;
        self.bodyTextView.text = self.question.body;
        
        self.questionScoreLabel.text = self.question.score;
        [self.ownerButton setTitle:self.question.owner.displayName forState:UIControlStateNormal];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showProfileForAsker"]) {
        ProfileViewController *pvc = [segue destinationViewController];
        pvc.userIdToShow = self.question.owner.userID;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
