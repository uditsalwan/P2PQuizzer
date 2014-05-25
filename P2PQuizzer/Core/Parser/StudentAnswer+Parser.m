//
//  StudentAnswer+Parser.m
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/25/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "StudentAnswer+Parser.h"
#import "Categories.h"

@implementation StudentAnswer (Parser)

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    StudentAnswer *studentAnswer = [[StudentAnswer alloc]init];
    
    studentAnswer.questionID = [[dictionary allKeys] objectAtIndex:0];
    studentAnswer.choiceID = [dictionary objectForKey:studentAnswer.questionID];
    
    return studentAnswer;
}

-(NSDictionary*)dictionaryForObject
{
    NSMutableDictionary *studentAnswerDictionary = [[NSMutableDictionary alloc]init];
    
    [studentAnswerDictionary safeSetObject:self.choiceID forKey:self.questionID];
    
    return studentAnswerDictionary;
}

@end
