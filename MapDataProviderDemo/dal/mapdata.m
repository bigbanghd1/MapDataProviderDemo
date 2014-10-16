//
//  mapdata.m
//  Map
//
//  Created by Wingman on 14-5-21.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "mapdata.h"

@implementation mapdata

- (NSDictionary *)mapDataWithMapId:(NSNumber *)mapid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT updateAt,w,h,tilesize,rotation,latmin,latmax,lngmin,lngmax FROM map WHERE id=%@", mapid.stringValue];
    return [self fetchOne:sql];
}


@end
