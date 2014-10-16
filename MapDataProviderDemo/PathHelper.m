//
//  PathHelper.m
//  MyHabit
//
//  Created by Gavin Yan on 12-10-11.
//  Copyright (c) 2012年 Gavin. All rights reserved.
//

#import "PathHelper.h"
#include <sys/xattr.h>


@implementation PathHelper

+ (BOOL)createPathIfNecessary:(NSString*)path {
	BOOL succeeded = YES;
	
	NSFileManager* fm = [NSFileManager defaultManager];
	if (![fm fileExistsAtPath:path]) {
		succeeded = [fm createDirectoryAtPath: path
				  withIntermediateDirectories: YES
								   attributes: nil
										error: nil];
	}
	
	return succeeded;
}



+ (NSString*)documentDirectoryPathWithName:(NSString*)name {
	NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* cachesPath = [paths objectAtIndex:0];
	NSString* cachePath = [cachesPath stringByAppendingPathComponent:name];
	
	[PathHelper createPathIfNecessary:cachesPath];
	[PathHelper createPathIfNecessary:cachePath];
	
	return cachePath;
}


+ (NSString*)cacheDirectoryPathWithName:(NSString*)name {
	//NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* cachesPath = [paths objectAtIndex:0];
	NSString* cachePath = [cachesPath stringByAppendingPathComponent:name];
	
	[PathHelper createPathIfNecessary:cachesPath];
	[PathHelper createPathIfNecessary:cachePath];
	
	return cachePath;
}


+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)path
{
    const char* filePath = [path fileSystemRepresentation];
    
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    
    int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
    return result == 0;
}

+ (void)copyFileFromPath:(NSString *)sourcePath ToPath:(NSString *)destinationPath
{
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager copyItemAtPath:sourcePath toPath:destinationPath error:&error]) {
        NSLog(@"拷贝文件失败:%@", error);
    }
    [PathHelper addSkipBackupAttributeToItemAtPath:destinationPath];
}

+ (BOOL)fileExistsAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:path];
}


+ (NSError *)remove:(NSString *)path
{
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:path error:&error];
    return error;
}

@end
