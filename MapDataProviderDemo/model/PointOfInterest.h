//
//  PointOfInterest.h
//  Map
//
//  Created by Wingman on 14-6-24.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PointOfInterest : NSObject

@property (nonatomic) NSNumber *poiid;
@property (nonatomic) NSNumber *venueid;
@property (nonatomic) BOOL hidden;
@property (nonatomic) NSString *poiCategory;
@property (nonatomic) NSNumber *poiCategoryId;
//@property (nonatomic) NSString *location;
@property (nonatomic) NSNumber *routingNodeId;
@property (nonatomic) double x;
@property (nonatomic) double y;

- (id)initWithRecord:(NSDictionary *)record;

@end
