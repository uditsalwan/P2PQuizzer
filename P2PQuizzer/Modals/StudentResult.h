//
//  StudentResult.h
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/18/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "ModalBase.h"

@interface StudentResult : ModalBase

@property (nonatomic,strong) NSString *studentID;
@property (nonatomic,strong) NSNumber *score;
@property (nonatomic) NSInteger rank;

@end
