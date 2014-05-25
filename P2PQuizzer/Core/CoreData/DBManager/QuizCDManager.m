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

-(Quiz*)quizEntityWithQuizID:(NSString*)quizID
{
    Quiz *quiz = nil;

    NSArray *quizCDModels = [self.dbHelper managedObjectsForModelClass:[QuizCDModel class] andPredicate:[NSPredicate predicateWithFormat:@"quizID = %@",quizID]];
    
    if (quizCDModels.count == 1)
    {
        quiz = [[Quiz alloc] init];
        QuizCDModel *managedObject = [quizCDModels objectAtIndex:0];
        [self fillObject:quiz fromCDModel:managedObject];
    }
    
    return quiz;
}

-(void) fillCDModel:(QuizCDModel*)model fromEntity:(Quiz*)quiz
{
    model.quizID = quiz.objectID;
    model.quizDetail = [[quiz dictionaryForObject] jsonString];
}

-(void) fillObject:(Quiz*)quiz fromCDModel:(QuizCDModel*)model
{
    quiz.objectID = model.quizID;
    quiz.quizDetails = model.quizDetail;
}

@end
