//
//  dbEngine.m
//  Map
//
//  Created by Wingman on 14-5-21.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "dbEngine.h"
#import "FMDatabase.h"
#import "PathHelper.h"

#define DB_FILE_NAME @"qbengoMap.sqlite"

@implementation dbEngine

- (id)init
{
    if (self = [super init]) {
        [self createEditableCopyOfDatabaseIfNeeded];
    }
    
    return self;
}

- (void)createEditableCopyOfDatabaseIfNeeded
{
    NSString *writableDBPath = [self DBFilePath];
    
    if ([PathHelper fileExistsAtPath:writableDBPath]) {
        return;
        //NSError *error = [PathHelper remove:writableDBPath];
        //NSLog(@"error: %@", error);
    }
    
    NSString *sourcePath = [self defaultDBPath];
//    NSLog(@"sourcePath: %@", sourcePath);
    [PathHelper copyFileFromPath:sourcePath ToPath:writableDBPath];
}



- (NSString *)defaultDBPath
{
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DB_FILE_NAME];
}


- (NSString *)DBFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    [PathHelper createPathIfNecessary:documentsDirectory];
    return [documentsDirectory stringByAppendingPathComponent:DB_FILE_NAME];
}


- (NSArray *)fetchAll:(NSString *)sql
{
    FMDatabase *database = [self openDB];
    FMResultSet *rs = [self query:sql DB:database];
    NSMutableArray *resoultArray = [NSMutableArray new];
    
    while ([rs next]) {
        [resoultArray addObject:[rs resultDictionary]];
    }
    
    //NSLog(@"resoult set: %@", resoultArray);
    [database close];
    return resoultArray;
}

- (NSDictionary *)fetchOne:(NSString *)sql
{
    FMDatabase *database = [self openDB];
    FMResultSet *rs = [self query:sql DB:database];
    NSDictionary *record;
    if ([rs next]) {
        record = [[rs resultDictionary] copy];
    }
    [database close];
    return record;
}

- (FMResultSet *)query:(NSString *)sql DB:(FMDatabase *)database
{
    NSLog(@"SQL: %@", sql);
    FMResultSet * result = [database executeQuery:sql];
    return result;
}

- (FMDatabase *)openDB
{
    NSLog(@"DBfilepath: %@", self.DBFilePath);
    FMDatabase *db = [FMDatabase databaseWithPath:self.DBFilePath];
    if (![db open]) {
        return nil;
    }
    return db;
}




@end
