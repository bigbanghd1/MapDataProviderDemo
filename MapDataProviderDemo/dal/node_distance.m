//
//  node_distance.m
//  Map
//
//  Created by Wingman on 14-5-21.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "node_distance.h"

@implementation node_distance


- (NSArray *)distanceList:(NSNumber *)venueid
{
    NSString *sql = [NSString stringWithFormat:
                     @"SELECT d.nodeid1,d.nodeid2,d.distance FROM node_distance d INNER JOIN node n1 ON n1.id=d.nodeid1 INNER JOIN node n2 ON n2.id=d.nodeid2 WHERE n1.venue_id=%@ AND n2.venue_id=%@",
                     venueid.stringValue, venueid.stringValue];
    return [self fetchAll:sql];
}

- (NSArray *)distanceLayerList:(NSNumber *)mapid
{
    NSString *sql = [NSString stringWithFormat:
                     @"SELECT d.nodeid1,d.nodeid2,d.distance FROM node_distance d INNER JOIN node n1 on n1.id=d.nodeid1 INNER JOIN node n2 on n2.id=d.nodeid2 WHERE n1.map_id=%@ AND n2.map_id=%@",
                     mapid.stringValue, mapid.stringValue];
    return [self fetchAll:sql];
}

- (NSArray *)distanceListWithMapId:(NSNumber *)mapid node1Id:(NSNumber *)node1id{
    NSString *sql = [NSString stringWithFormat:@"SELECT d.nodeid1,d.nodeid2,d.distance FROM node_distance d INNER JOIN node n1 on n1.id=d.nodeid1 INNER JOIN node n2 on n2.id=d.nodeid2 WHERE n1.map_id=%@ AND n2.map_id=%@ AND n1.id=%@",mapid
                     .stringValue,mapid.stringValue,node1id.stringValue];
    return [self fetchAll:sql];
}

@end
