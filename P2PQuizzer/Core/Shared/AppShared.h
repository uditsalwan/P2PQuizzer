//
//  AppShared.h
//  P2PQuizzer
//
//  Created by Udit Salwan on 11/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPCHandler.h"

@interface AppShared : NSObject

@property (nonatomic, strong) MPCHandler *mpcHandler;

+ (AppShared*) sharedInstance;

@end
