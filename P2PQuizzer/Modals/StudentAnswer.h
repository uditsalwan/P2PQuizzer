//
//  StudentAnswer.h
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/18/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "ModalBase.h"

@interface StudentAnswer : ModalBase

@property (nonatomic,strong) NSString *questionID;
@property (nonatomic,strong) NSString *choiceID;

@end
