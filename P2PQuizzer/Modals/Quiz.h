//
//  Quiz.h
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/18/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "ModalBase.h"

@interface Quiz : ModalBase

@property (nonatomic,strong) NSString *title;
@property (nonatomic) NSInteger numberOfQuestions;
@property (nonatomic,strong) NSString *createdBy;
@property (nonatomic,strong) NSMutableArray *questions;

// JSON string stored in CoreData
@property (nonatomic,strong) NSString *quizDetails;

@end
