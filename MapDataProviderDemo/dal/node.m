//
//  node.m
//  Map
//
//  Created by Wingman on 14-5-21.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "node.h"

@implementation node

/*
- (NSNumber *)marginNodeIdWithVenue:(NSNumber *)venueid
{
    NSString *sql = [NSString stringWithFormat:@"select min(nodeid)-1 nodeid from node where venueid=%@",
                     venueid.stringValue];
    NSDictionary *record = [self fetchOne:sql];
    if (!record) {
        return nil;
    }
    return [record objectForKey:@"nodeid"];
}*/

- (NSArray *)nodesWithMap:(NSNumber *)mapid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT id,x,y FROM node WHERE map_id=%@",
                     mapid.stringValue];
    return [self fetchAll:sql];
}

- (NSDictionary *)nodeWithId:(NSNumber *)nodeid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM node WHERE id = %@",
                     nodeid.stringValue];
    return [self fetchOne:sql];
}


- (NSDictionary *)nodeWithId:(NSNumber *)nodeid InMap:(NSNumber *)mapid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * from node WHERE id = %@ AND map_id = %@",
                     nodeid.stringValue, mapid.stringValue];
    return [self fetchOne:sql];
}


@end
