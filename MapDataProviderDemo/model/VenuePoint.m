//
//  VenuePoint.m
//  Map
//
//  Created by Wingman on 14-6-26.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "VenuePoint.h"

@implementation VenuePoint

- (id)initWithRecord:(NSDictionary *)record
{
    if (!record) {
        return nil;
    }
    self = [super init];
    if (self) {
        _venueid = [record objectForKey:@"id"];
        _latitude = [record objectForKey:@"lat"];
        _longitude = [record objectForKey:@"lng"];
        _name = [record objectForKey:@"name"];
        _desc = [record objectForKey:@"description"];
        _infoHtml = [record objectForKey:@"longdesc"];
    }
    return self;
}
@end
