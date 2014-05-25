//
//  Quiz.h
//  P2PQuizzer
//
//  Created by Udit Salwan on 24/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface QuizCDModel : NSManagedObject

@property (nonatomic, retain) NSString * quizID;
@property (nonatomic, retain) NSString * quizDetail;

@end
