//
//  Result+Parser.m
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/25/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "Result+Parser.h"
#import "Categories.h"

@implementation Result (Parser)

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    Result *result = [[Result alloc]init];
    
    result.quizID = [dictionary objectForKey:@"quizID"];
    NSMutableArray *studentResults = [[NSMutableArray alloc]init];
    
    for (NSDictionary *studentResult in [dictionary objectForKey:@"student_result"])
    {
        [studentResults addObject:[[StudentResult alloc] initWithDictionary:studentResult]];
    }
    
    result.studentResult = [[NSArray alloc]initWithArray:studentResults];
    
    NSMutableArray *topScorers = [[NSMutableArray alloc]init];
    
    for (NSDictionary *topScorer in [dictionary objectForKey:@"top_scorers"])
    {
        [topScorers addObject:[[TopScorer alloc] initWithDictionary:topScorer]];
    }
    
    result.topScorers = [[NSArray alloc]initWithArray:topScorers];
    
    return result;
}

-(NSDictionary*)dictionaryForObject
{
    NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc]init];
    
    [resultDictionary safeSetObject:self.quizID forKey:@"quizID"];
    
    NSMutableArray *studentResults = [[NSMutableArray alloc]init];
    
    for (StudentResult *studentResult in self.studentResult)
    {
        [studentResults addObject:[studentResult dictionaryForObject]];
    }
    
    [resultDictionary safeSetObject:studentResults forKey:@"student_result"];
    
    NSMutableArray *topScorers = [[NSMutableArray alloc]init];
    
    for (TopScorer *topScorer in self.topScorers)
    {
        [topScorers addObject:[topScorer dictionaryForObject]];
    }
    
    [resultDictionary safeSetObject:topScorers forKey:@"top_scorers"];
    
    return resultDictionary;
}


@end
