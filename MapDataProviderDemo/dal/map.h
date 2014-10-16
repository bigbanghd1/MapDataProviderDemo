//
//  MapDB.h
//  Map
//
//  Created by Wingman on 14-5-21.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dbEngine.h"

@interface map : dbEngine


- (NSDictionary *)mapWithMapId:(NSNumber *)mapId;
- (NSArray *)overviewMap:(NSNumber *)venueid;
- (NSArray *)floorMaps:(NSNumber *)venueid;
- (NSDictionary *)firstNonOverMap:(NSNumber *)venueid;

@end
