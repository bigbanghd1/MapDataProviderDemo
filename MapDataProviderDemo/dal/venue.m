//
//  venue.m
//  Map
//
//  Created by Wingman on 14-5-22.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "venue.h"

@implementation venue

- (NSArray *)venueList
{
    NSString *sql = @"SELECT * FROM venue";
    return [self fetchAll:sql];
}

- (NSDictionary *)venueWithPoiId:(NSNumber *)poiId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM venue LEFT JOIN poi ON poi.venue_id = venue.id WHERE poi.id=%@", poiId.stringValue];
    return [self fetchOne:sql];
}

- (NSNumber *)venueIdWithPoiId:(NSNumber *)poiId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT venue_id FROM poi WHERE id=%@", poiId.stringValue];
    NSDictionary *record = [self fetchOne:sql];
    return [record objectForKey:@"venue_id"];
}

- (NSDictionary *)venueWithId:(NSNumber *)venueId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM venue WHERE venue_id=%@", venueId.stringValue];
    return [self fetchOne:sql];
}

- (NSArray *)search:(NSString *)key
{
    NSString *likeKey = [NSString stringWithFormat:@"%%%@%%", key];
    NSString *sql = [NSString stringWithFormat:@"select * from venue where lower(name) like lower('%@')", likeKey];
    return [self fetchAll:sql];
}

@end
