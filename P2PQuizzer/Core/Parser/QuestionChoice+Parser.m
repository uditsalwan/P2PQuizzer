//
//  QuestionChoice+Parser.m
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/25/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "QuestionChoice+Parser.h"
#import "Categories.h"

@implementation QuestionChoice (Parser)

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    QuestionChoice *choice = [[QuestionChoice alloc]init];
    
    choice.objectID = [dictionary objectForKey:@"id"];
    choice.choiceText = [dictionary objectForKey:@"text"];
    
    return choice;
}

-(NSDictionary*)dictionaryForObject
{
    NSMutableDictionary *choiceDictionary = [[NSMutableDictionary alloc]init];
    
    [choiceDictionary safeSetObject:self.choiceText forKey:@"text"];
    [choiceDictionary safeSetObject:self.objectID forKey:@"id"];
    
    return choiceDictionary;
}
@end
