//
//  DetailViewController.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 9/23/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Question;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Question *question;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *bodyLabel;
@property (strong, nonatomic) IBOutlet UILabel *questionScoreLabel;
@property (strong, nonatomic) IBOutlet UIButton *ownerButton;

@end
