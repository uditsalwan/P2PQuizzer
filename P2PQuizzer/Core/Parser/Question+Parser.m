//
//  Question+Parser.m
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/25/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "Categories.h"

@implementation Question (Parser)

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    Question *question = [[Question alloc]init];
    
    question.objectID = [dictionary objectForKey:@"questionID"];
    question.qType = [[dictionary objectForKey:@"questionType"] integerValue];
    question.questionText = [dictionary objectForKey:@"text"];
    question.correctAnswer = [dictionary objectForKey:@"correctAnswer"];
    
    NSMutableArray *choices = [[NSMutableArray alloc]init];
    
    for (NSDictionary *choiceDictionary in [dictionary objectForKey:@"choices"])
    {
        [choices addObject:[[QuestionChoice alloc]initWithDictionary:choiceDictionary]];
    }
    
    question.choices = [[NSArray alloc]initWithArray:choices];
    return question;
}

-(NSDictionary*)dictionaryForObject
{
    NSMutableDictionary *questionDictionary = [[NSMutableDictionary alloc]init];
    
    [questionDictionary safeSetObject:self.objectID forKey:@"questionID"];
    [questionDictionary safeSetObject:[NSString stringWithFormat:@"%d",self.qType] forKey:@"questionType"];
    [questionDictionary safeSetObject:self.questionText forKey:@"text"];
    [questionDictionary safeSetObject:self.correctAnswer forKey:@"correctAnswer"];
    
    NSMutableArray *choicesArray = [[NSMutableArray alloc]init];
    
    for (QuestionChoice *choice in self.choices)
    {
        [choicesArray addObject:[choice dictionaryForObject]];
    }
    
    [questionDictionary safeSetObject:choicesArray forKey:@"choices"];
    
    return questionDictionary;
}

@end
