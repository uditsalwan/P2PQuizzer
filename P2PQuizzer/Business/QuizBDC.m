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

// Get Quiz from Core Data
+(Quiz*) quizWithID:(NSString*)quizID
{
    QuizCDManager* manager = [[QuizCDManager alloc] init];
    Quiz *quiz = [manager quizEntityWithQuizID:quizID];
    
    Quiz *newQuiz = nil;
    NSDictionary *contentDictionary;
    
    if (quiz)
    {
        if(quiz.quizDetails)
        {
            __autoreleasing NSError *parseError;
            contentDictionary = [NSJSONSerialization
                                 JSONObjectWithData:[quiz.quizDetails dataUsingEncoding:NSUTF8StringEncoding]
                                 options: NSJSONReadingMutableContainers
                                 error: &parseError];
        }

        newQuiz = [[Quiz alloc] initWithDictionary:contentDictionary];
        newQuiz.objectID = quiz.objectID;
    }
    return newQuiz;
}

@end
