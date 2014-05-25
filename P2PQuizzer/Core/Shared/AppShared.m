//
//  AppShared.m
//  P2PQuizzer
//
//  Created by Udit Salwan on 11/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "AppShared.h"

@implementation AppShared
//test svn

+ (AppShared*)sharedInstance
{
    static AppShared *singleton = nil;
    
    static dispatch_once_t pred;        // Lock
    dispatch_once(&pred, ^{             // This code is called at most once per app
        singleton = [[AppShared alloc] init];
    });
    
    return singleton;
}

@end
