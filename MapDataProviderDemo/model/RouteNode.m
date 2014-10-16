//
//  RouteNode.m
//  Map
//
//  Created by Wingman on 14-7-3.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "RouteNode.h"

@implementation RouteNode

- (id)initWithRecord:(NSDictionary *)record
{
    self = [super init];
    if (self) {
        _nodeId = [record objectForKey:@"id"];
        _mapId = [record objectForKey:@"map_id"];
        _x = [[record objectForKey:@"x"] doubleValue];
        _y = [[record objectForKey:@"y"] doubleValue];
    }
    return self;
}

@end
