//
//  NSDictionary+Utilities.h
//  QuickDesignAuditApp
//
//  Created by Udit
//  Copyright (c) 2012 NTEG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Utilities)

- (NSString*) jsonString;

@end

@interface NSMutableDictionary (Utilities)

- (void)safeSetObject:(id)anObject forKey:(id)aKey;

@end
