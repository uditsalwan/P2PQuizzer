//
//  QuizBDC.m
//  P2PQuizzer
//
//  Created by Udit Salwan on 25/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "QuizBDC.h"
#import "QuizCDManager.h"

@implementation QuizBDC

+(BOOL)saveQuiz:(Quiz*)quiz
{
    QuizCDManager* manager = [[QuizCDManager alloc] init];
    return [manager saveQuiz:quiz];
}

@end
