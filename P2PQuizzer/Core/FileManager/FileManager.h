//
//  FileManager.h
//  P2PQuizzer
//
//  Created by Udit Salwan on 25/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

+(NSString*)saveFileWithName:(NSString*)fileName inFolder:(NSString*)folderName withData:(NSData*)data;

@end
