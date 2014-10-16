//
//  MapDB.m
//  Map
//
//  Created by Wingman on 14-5-21.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "map.h"


@implementation map


- (NSDictionary *)mapWithMapId:(NSNumber *)mapId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT map.id, map.venue_id, map.type, map.subtype, map.floor, venue.name FROM map LEFT JOIN venue ON map.venue_id = venue.id WHERE map.id=%@ ", mapId.stringValue];
    return [self fetchOne:sql];
}

- (NSDictionary *)mapWithVenue:(NSNumber *)venueid Type:(NSString *)type SubType:(NSString *)subtype
{
    NSString *sql = [NSString stringWithFormat:@"SELECT id,venue_id,type,subtype,floor FROM map WHERE venue_id=%@ AND type='%@' AND subtype='%@' ", venueid.stringValue, type, subtype];
    return [self fetchOne:sql];
}

- (NSArray *)overviewMap:(NSNumber *)venueid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT id,venue_id,type,subtype,floor FROM map WHERE venue_id=%@ AND type='overview' ", venueid.stringValue];
    return [self fetchAll:sql];
}

- (NSArray *)floorMaps:(NSNumber *)venueid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT id,venue_id,type,subtype,floor FROM map WHERE venue_id=%@ AND type='floor' ", venueid.stringValue];
    return [self fetchAll:sql];
}

- (NSArray *)mapTypesWithVenue:(NSNumber *)venueid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT type FROM map WHERE venue_id=%@ ", venueid.stringValue];
    return [self fetchAll:sql];
}

- (NSArray *)mapSubtypes:(NSNumber *)venueid :(NSString *)type
{
    NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT subtype FROM map WHERE venue_id=%@ AND type=%@", venueid.stringValue, type];
    return [self fetchAll:sql];
}

- (NSDictionary *)firstNonOverMap:(NSNumber *)venueid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT id,venue_id,type,subtype,floor FROM map WHERE venue_id=%@ AND type!='overview' ", venueid.stringValue];
    return [self fetchOne:sql];
}

@end
