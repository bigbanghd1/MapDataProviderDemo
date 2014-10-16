//
//  RouteNode.h
//  Map
//
//  Created by Wingman on 14-7-3.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RouteNode : NSObject

@property (nonatomic) NSNumber *nodeId;
@property (nonatomic) NSNumber *mapId;
@property (nonatomic) double x;
@property (nonatomic) double y;

- (id)initWithRecord:(NSDictionary *)record;

@end
