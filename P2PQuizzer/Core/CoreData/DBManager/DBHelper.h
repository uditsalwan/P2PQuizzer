//
//  DBHelper.h
//  P2PQuizzer
//
//  Created by Udit Salwan on 25/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBHelper : NSObject

+ (DBHelper*)sharedDBHelper;

-(NSManagedObject *) modelForEntityName:(NSString *)entityName;
-(BOOL) saveObject:(NSManagedObject *)object;

@end
