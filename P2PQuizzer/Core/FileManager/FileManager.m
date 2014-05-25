//
//  FileManager.m
//  P2PQuizzer
//
//  Created by Udit Salwan on 25/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

+(NSString *)creteFolderWithName : (NSString *)strFolderName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:strFolderName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
    {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&error];
        return dataPath;
    }
    else
        return dataPath;
}

+(NSString*)saveFileWithName:(NSString*)fileName inFolder:(NSString*)folderName withData:(NSData*)data
{
    NSString *strFullPath = [[[self creteFolderWithName:folderName] stringByAppendingPathComponent:fileName] stringByAppendingPathExtension:kAppFileExtension];
    
    if([data writeToFile:strFullPath atomically:NO])
    {
        return strFullPath;
    }
    else
    {
        return @"";
    }
}

@end
