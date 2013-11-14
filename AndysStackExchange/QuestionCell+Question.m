//
//  QuestionCell+Question.m
//  AndysStackExchange
//
//  Created by Andrew Obusek on 11/14/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "QuestionCell+Question.h"
#import "Question.h"

@implementation QuestionCell (Question)

- (void) updateWithQuestion:(Question *)question
{
    self.titleLabel.text = question.title;
    self.bodyLabel.text = question.body;
    self.scoreLabel.text = question.score;
    self.answerCountLabel.text = question.answerCount;
    self.viewCountLabel.text = question.viewCount;
}

@end
