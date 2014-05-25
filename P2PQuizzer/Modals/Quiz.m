//
//  Quiz.m
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/18/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz

-(id)init
{
    if (self = [super init])
    {
        self.questions = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
