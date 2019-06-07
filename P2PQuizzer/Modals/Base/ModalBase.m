//
//  ModalBase.m
//  P2PQuizzer
//
//  Created by Swati Aggarwal on 5/18/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "ModalBase.h"
#import "Categories.h"

@implementation ModalBase

-(id)init
{
    if (self = [super init]) {
        self.objectID = [NSString uniqueIdentifierString];
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

-(NSDictionary*)dictionaryForObject
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end
