//
//  QuestionCell+Question.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 11/14/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import "QuestionCell.h"

@class Question;

@interface QuestionCell (Question)

- (void) updateWithQuestion:(Question *)question;

@end
