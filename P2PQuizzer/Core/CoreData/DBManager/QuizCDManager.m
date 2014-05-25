//
//  QuizCDManager.m
//  P2PQuizzer
//
//  Created by Udit Salwan on 25/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "QuizCDManager.h"
#import "QuizCDModel.h"

@implementation QuizCDManager

-(BOOL)saveQuiz:(Quiz*)quiz
{
    QuizCDModel* quizCDModel = (QuizCDModel*)[self.dbHelper modelForEntityName:@"Quiz"];
    [self fillCDModel:quizCDModel fromEntity:quiz];
    [self.dbHelper saveObject:quizCDModel];
    return YES;
}

-(void) fillCDModel:(QuizCDModel*)model fromEntity:(Quiz*)quiz
{
    model.quizID = quiz.objectID;
    model.quizDetail = quiz.title;
}

@end
