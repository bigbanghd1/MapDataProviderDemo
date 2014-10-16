//
//  venue.h
//  Map
//
//  Created by Wingman on 14-5-22.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dbEngine.h"

@interface venue : dbEngine

- (NSArray *)venueList;
- (NSDictionary *)venueWithPoiId:(NSNumber *)poiId;
- (NSNumber *)venueIdWithPoiId:(NSNumber *)poiId;
- (NSDictionary *)venueWithId:(NSNumber *)venueId;
- (NSArray *)search:(NSString *)key;

@end
