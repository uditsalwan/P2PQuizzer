//
//  BaseDBManager.m
//  P2PQuizzer
//
//  Created by Udit Salwan on 25/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "BaseCDManager.h"

@implementation BaseCDManager

-(id)init
{
    if (self = [super init]) {
        self.dbHelper = [DBHelper sharedDBHelper];
    }
    return self;
}

@end
