//
//  TopScorer+Parser.m
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/25/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "TopScorer+Parser.h"
#import "Categories.h"

@implementation TopScorer (Parser)

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    TopScorer *topScorer = [[TopScorer alloc]init];
    
    topScorer.studentID = [dictionary objectForKey:@"studentID"];
    topScorer.rollNo = [[dictionary objectForKey:@"rollNo"] integerValue];
    topScorer.studentName = [dictionary objectForKey:@"name"];
    
    return topScorer;
}

-(NSDictionary*)dictionaryForObject
{
    NSMutableDictionary *topScorerDictionary = [[NSMutableDictionary alloc]init];
    
    [topScorerDictionary safeSetObject:self.studentID forKey:@"studentID"];
    [topScorerDictionary safeSetObject:[NSString stringWithFormat:@"%d",self.rollNo] forKey:@"rollNo"];
    [topScorerDictionary safeSetObject:self.studentName forKey:@"name"];
    
    return topScorerDictionary;
}

@end
