//
//  zoomlevel.m
//  Map
//
//  Created by Wingman on 14-5-22.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "zoomlevel.h"

@implementation zoomlevel


- (NSDictionary *)zoomLevelWithMap:(NSNumber *)mapid Zoom:(int)zoom
{
    NSString *sql = [NSString stringWithFormat:@"SELECT id FROM zoomlevel WHERE map_id=%d AND zoom=%d",
                     mapid.intValue,
                     zoom];
    return [self fetchOne:sql];
}

- (NSArray *)zoomlevelListWithMap:(NSNumber *)mapid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT id,map_id,zoom FROM zoomlevel WHERE map_id=%d",
                     mapid.intValue];
    return [self fetchAll:sql];
}

- (NSDictionary *)tileWithZoomlevel:(NSNumber *)zoomlevel X:(int)x Y:(int)y
{
    NSString *sql = [NSString stringWithFormat:@"SELECT data,contentType FROM tile WHERE zoomlevel_id=%d AND x=%d AND y=%d",
                     zoomlevel.intValue,
                     x, y];
    return [self fetchOne:sql];
}

- (NSDictionary *)zoomRangeWithMap:(NSNumber *)mapid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT min(zoom) AS min_zoom,max(zoom) AS max_zoom FROM zoomlevel WHERE map_id=%d", mapid.intValue];
    return [self fetchOne:sql];
}

@end
