//
//  node.h
//  Map
//
//  Created by Wingman on 14-5-21.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dbEngine.h"

@interface node : dbEngine

//- (NSNumber *)marginNodeIdWithVenue:(NSNumber *)venueid;
- (NSArray *)nodesWithMap:(NSNumber *)mapid;
- (NSDictionary *)nodeWithId:(NSNumber *)nodeid;
- (NSDictionary *)nodeWithId:(NSNumber *)nodeid InMap:(NSNumber *)mapid;

@end
