//
//  Quiz+Parser.m
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/25/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "Quiz+Parser.h"
#import "Categories.h"

@implementation Quiz (Parser)

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    Quiz *quiz = [[Quiz alloc]init];
    
    quiz.objectID = [dictionary objectForKey:@"quizID"];
    quiz.createdBy = [dictionary objectForKey:@"teacherID"];
    quiz.title = [dictionary objectForKey:@"title"];
    quiz.numberOfQuestions = [[dictionary objectForKey:@"number_of_questions"] integerValue];
    
    NSMutableArray *questions = [[NSMutableArray alloc]init];
    
    for (NSDictionary *questionDictionary in [dictionary objectForKey:@"questions"])
    {
        [questions addObject:[[Question alloc]initWithDictionary:questionDictionary]];
    }
    
    quiz.questions = [[NSArray alloc]initWithArray:questions];
    
    return quiz;
}

-(NSDictionary*)dictionaryForObject
{
    NSMutableDictionary *quizDictionary = [[NSMutableDictionary alloc]init];
    
    [quizDictionary safeSetObject:self.objectID forKey:@"quizID"];
    [quizDictionary safeSetObject:self.createdBy forKey:@"teacherID"];
    [quizDictionary safeSetObject:self.title forKey:@"title"];
    [quizDictionary safeSetObject:[NSString stringWithFormat:@"%d",self.numberOfQuestions] forKey:@"number_of_questions"];
    
    NSMutableArray *questionsArray = [[NSMutableArray alloc]init];
    
    for (Question *question in self.questions)
    {
        [questionsArray addObject:[question dictionaryForObject]];
    }
    
    [quizDictionary safeSetObject:questionsArray forKey:@"questions"];
    
    return quizDictionary;
}

@end
