//
//  NSString+Utilities.m
//  P2PQuizzer
//
//  Created by Udit Salwan on 25/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "NSString+Utilities.h"

@implementation NSString (Utilities)

+ (NSString *)uniqueIdentifierString
{
    NSString *string = [[[NSUUID UUID] UUIDString] lowercaseString];
    return string;
}

@end
