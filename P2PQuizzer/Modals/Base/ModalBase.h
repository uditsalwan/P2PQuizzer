//
//  ModalBase.h
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/18/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Models.h"

typedef enum
{
    kTeacher = 1,
    kStudent = 2
    
}UserRole;

typedef enum
{
    kSingleAnswerType = 1,
    kMultipleAnswerType = 2,
    kMatchTheFollowingType = 3
}QuestionType;

@interface ModalBase : NSObject

@property (nonatomic,strong) NSString * objectID;

-(id)initWithDictionary:(NSDictionary*)dictionary;
-(NSDictionary*)dictionaryForObject;

@end
