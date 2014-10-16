//
//  node_distance.h
//  Map
//
//  Created by Wingman on 14-5-21.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dbEngine.h"

@interface node_distance : dbEngine

- (NSArray *)distanceList:(NSNumber *)venueid;
- (NSArray *)distanceLayerList:(NSNumber *)mapid;

- (NSArray *)distanceListWithMapId:(NSNumber *)mapid node1Id:(NSNumber *)node1id;//新增方法，通过已知的nodeid查表
@end
