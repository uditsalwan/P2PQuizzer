//
//  Result.h
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/18/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "ModalBase.h"

@interface Result : ModalBase

@property (nonatomic,retain) NSString *quizID;
@property (nonatomic,strong) NSArray *studentResult;
@property (nonatomic,strong) NSArray *topScorers;
@end
