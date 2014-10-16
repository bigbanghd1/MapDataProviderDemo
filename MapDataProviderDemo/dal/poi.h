//
//  poi.h
//  Map
//
//  Created by Wingman on 14-5-22.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dbEngine.h"


@interface poi : dbEngine

- (NSNumber *)routeNodeIdWithPoi:(NSNumber *)poiid;
- (NSArray *)search:(NSString *)key;
- (NSDictionary *)maindoorOfVenue:(NSNumber *)venueId;
- (NSDictionary *)poiWithId:(NSNumber *)poiId;
- (NSArray *)poisWithVenueId:(NSNumber *)venueId;
- (NSArray *)poisWithMapId:(NSNumber *)mapId;
- (NSArray *)poisWithVenueId:(NSNumber *)venueId MapId:(NSNumber *)mapId;

@end
