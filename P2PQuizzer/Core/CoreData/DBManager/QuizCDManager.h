//
//  QuizCDManager.h
//  P2PQuizzer
//
//  Created by Udit Salwan on 25/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "BaseCDManager.h"

@interface QuizCDManager : BaseCDManager

-(BOOL)saveQuiz:(Quiz*)quiz;
-(Quiz*)quizEntityWithQuizID:(NSString*)quizID;

@end
