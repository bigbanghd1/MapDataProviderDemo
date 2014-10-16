//
//  PointOfInterest.m
//  Map
//
//  Created by Wingman on 14-6-24.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "PointOfInterest.h"

@implementation PointOfInterest

- (id)initWithRecord:(NSDictionary *)record
{
    if (!record) {
        return nil;
    }
    self = [super init];
    if (self) {
        _poiid = [record objectForKey:@"id"];
        _venueid = [record objectForKey:@"venue_id"];
        _hidden = ([[record objectForKey:@"hidden"] intValue] == 1);
        _poiCategory = [record objectForKey:@"poi_category"];
        _poiCategoryId = [record objectForKey:@"category_id"];
        //_location = [record objectForKey:@"location"];
        _routingNodeId = [record objectForKey:@"node_id"];
        _x = [[record objectForKey:@"x"] doubleValue];
        _y = [[record objectForKey:@"y"] doubleValue];
        
    }
    return self;
}

@end
