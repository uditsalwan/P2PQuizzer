//
//  NSDictionary+Utilities.m
//  QuickDesignAuditApp
//
//  Created by Udit
//  Copyright (c) 2012 NTEG. All rights reserved.
//

#import "NSDictionary+Utilities.h"

@implementation NSDictionary (Utilities)

// Converts a dictionary into JSON string
- (NSString *)jsonString
{
    __autoreleasing NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    if (! jsonData)
    {
        return nil;
    }
    else
    {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                     encoding:NSUTF8StringEncoding];
        return jsonString;
    }
}
@end

@implementation NSMutableDictionary (Utilities)

- (void)safeSetObject:(id)anObject forKey:(id)aKey
{
    if (anObject)
    {
        [self setObject:anObject forKey:aKey];
    }
}

@end
