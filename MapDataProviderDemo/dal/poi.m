//
//  poi.m
//  Map
//
//  Created by Wingman on 14-5-22.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "poi.h"
#import "map.h"

@implementation poi


- (NSArray *)search:(NSString *)key
{
    NSString *likeKey = [NSString stringWithFormat:@"%%%@%%", key];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM v_poi WHERE lower(name) LIKE lower('%@') OR lower(nicknames) LIKE lower('%@')", likeKey, likeKey];
    return [self fetchAll:sql];
}

- (NSArray *)coordsWithPoiid:(NSNumber *)poiid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM v_poi where id=%d", poiid.intValue];
    return [self fetchAll:sql];
}

- (NSNumber *)overviewMapid
{
    /*
    NSArray *overviewMaps = [[map new] overviewMap:_venueid];
    if (!overviewMaps) {
        return nil;
    }
    if (overviewMaps.count == 0) {
        return nil;
    }
    NSDictionary *filter = [[NSDictionary alloc]initWithObjectsAndKeys:
                            _venueid, @"venueid",
                            @"overview", @"type",
                            @"", @"subtype", nil];
    NSArray *pois = [self poiList:filter];
    if (!pois) {
        return nil;
    }
    if (pois.count == 0) {
        return nil;
    }*/
    return nil;
}

- (NSNumber *)routeNodeIdWithPoi:(NSNumber *)poiid
{
    NSString * sql = [NSString stringWithFormat:@"SELECT node_id FROM v_poi WHERE id=%d", poiid.intValue];
    NSDictionary *record = [self fetchOne:sql];
    if (!record) {
        return nil;
    }
    return [record objectForKey:@"node_id"];
}

- (NSDictionary *)maindoorOfVenue:(NSNumber *)venueId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM v_poi WHERE poi_category = 'Main Entrance' AND venueid = %@",
                     venueId.stringValue];
    return [self fetchOne:sql];
}


- (NSDictionary *)poiWithId:(NSNumber *)poiId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM v_poi WHERE id = %@",
                     poiId.stringValue];
    return [self fetchOne:sql];
}

- (NSArray *)poisWithVenueId:(NSNumber *)venueId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM v_poi WHERE venue_id = %@", venueId.stringValue];
    return [self fetchAll:sql];
}

- (NSArray *)poisWithMapId:(NSNumber *)mapId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM v_poi WHERE map_id = %@", mapId.stringValue];
    return [self fetchAll:sql];
}

- (NSArray *)poisWithVenueId:(NSNumber *)venueId MapId:(NSNumber *)mapId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM v_poi WHERE venue_id = %@ AND map_id = %@", venueId.stringValue, mapId.stringValue];
    return [self fetchAll:sql];
}

@end
