//
//  BaseDBManager.h
//  P2PQuizzer
//
//  Created by Udit Salwan on 25/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBHelper.h"

@interface BaseCDManager : NSObject

@property(nonatomic, strong) DBHelper* dbHelper;

@end
