//
//  zoomlevel.h
//  Map
//
//  Created by Wingman on 14-5-22.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dbEngine.h"

@interface zoomlevel : dbEngine

- (NSDictionary *)zoomLevelWithMap:(NSNumber *)mapid Zoom:(int)zoom;
- (NSArray *)zoomlevelListWithMap:(NSNumber *)mapid;
- (NSDictionary *)tileWithZoomlevel:(NSNumber *)zoomlevel X:(int)x Y:(int)y;
- (NSDictionary *)zoomRangeWithMap:(NSNumber *)mapid;

@end
