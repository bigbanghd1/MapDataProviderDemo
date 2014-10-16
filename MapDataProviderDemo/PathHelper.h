//
//  PathHelper.h
//  MyHabit
//
//  Created by Gavin Yan on 12-10-11.
//  Copyright (c) 2012年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PathHelper : NSObject

+ (BOOL)createPathIfNecessary:(NSString*)path;

+ (NSString*)documentDirectoryPathWithName:(NSString*)name;

+ (NSString*)cacheDirectoryPathWithName:(NSString*)name;

+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)path;

+ (void)copyFileFromPath:(NSString *)sourcePath ToPath:(NSString *)destinationPath;

+ (BOOL)fileExistsAtPath:(NSString *)path;

+ (NSError *)remove:(NSString *)path;

@end
