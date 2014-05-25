//
//  StudentResult+Parser.m
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/25/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "StudentResult+Parser.h"
#import "Categories.h"

@implementation StudentResult (Parser)

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    StudentResult *studentResult = [[StudentResult alloc]init];
    
    studentResult.studentID = [dictionary objectForKey:@"studentID"];
    studentResult.score = [NSNumber numberWithFloat: [[dictionary objectForKey:@"score"] floatValue]];
    studentResult.rank = [[dictionary objectForKey:@"rank"] integerValue];
    
    return studentResult;
}

-(NSDictionary*)dictionaryForObject
{
    NSMutableDictionary *studentResultDictionary = [[NSMutableDictionary alloc]init];
    
    [studentResultDictionary safeSetObject:self.studentID forKey:@"studentID"];
    [studentResultDictionary safeSetObject:[NSString stringWithFormat:@"%f",[self.score floatValue]] forKey:@"score"];
    [studentResultDictionary safeSetObject:[NSString stringWithFormat:@"%d",self.rank] forKey:@"rank"];
    return studentResultDictionary;
}
@end
