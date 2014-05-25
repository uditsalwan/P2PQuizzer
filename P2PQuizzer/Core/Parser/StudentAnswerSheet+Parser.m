//
//  StudentAnswerSheet+Parser.m
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/25/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "StudentAnswerSheet+Parser.h"
#import "Categories.h"

@implementation StudentAnswerSheet (Parser)

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    StudentAnswerSheet *studentAnswerSheet = [[StudentAnswerSheet alloc]init];
    
    studentAnswerSheet.quizID = [dictionary objectForKey:@"quizID"];
    studentAnswerSheet.studentID = [dictionary objectForKey:@"studentID"];
    
    NSMutableArray *studentAnswers = [[NSMutableArray alloc]init];
    
    for (NSDictionary *studentAnswer in [dictionary objectForKey:@"student_answers"])
    {
        [studentAnswers addObject:[[StudentAnswer alloc] initWithDictionary:studentAnswer]];
    }
    
    studentAnswerSheet.studentAnswers = [[NSArray alloc]initWithArray:studentAnswers];
    return studentAnswerSheet;
}

-(NSDictionary*)dictionaryForObject
{
    NSMutableDictionary *studentAnswerSheetDictionary = [[NSMutableDictionary alloc]init];
    
    [studentAnswerSheetDictionary safeSetObject:self.quizID forKey:@"quizID"];
    [studentAnswerSheetDictionary safeSetObject:self.studentID forKey:@"studentID"];
    
    NSMutableArray *studentAnswers = [[NSMutableArray alloc]init];
    
    for (StudentAnswer *studentAnswer in self.studentAnswers)
    {
        [studentAnswers addObject:[studentAnswer dictionaryForObject]];
    }
    [studentAnswerSheetDictionary safeSetObject:studentAnswers forKey:@"student_answers"];
    
    return studentAnswerSheetDictionary;
}

@end
