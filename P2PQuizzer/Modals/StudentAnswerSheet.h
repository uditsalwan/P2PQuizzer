//
//  StudentAnswerSheet.h
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/25/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "ModalBase.h"

@interface StudentAnswerSheet : ModalBase

@property (nonatomic,strong) NSString *quizID;
@property (nonatomic,strong) NSString *studentID;
@property (nonatomic,strong) NSArray *studentAnswers;
@end
