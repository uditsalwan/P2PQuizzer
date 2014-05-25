//
//  Question.h
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/18/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "ModalBase.h"

@interface Question : ModalBase

@property (nonatomic) QuestionType qType;
@property (nonatomic,strong) NSString *questionText;
@property (nonatomic,strong) NSString *correctAnswer;
@property (nonatomic,strong) NSArray *choices;

@end