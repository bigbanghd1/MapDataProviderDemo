//
//  QbengoMapEngine.h
//  Map
//
//  Created by Wingman on 14-6-5.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "PointOfInterest.h"
#import "VenuePoint.h"
#import "CommonPoint.h"
#import "RouteNode.h"


@interface QbengoMapEngine : NSObject

@property (nonatomic) NSNumber *mapId;
@property (nonatomic) int minZoom;
@property (nonatomic) int maxZoom;
@property (nonatomic) int tileSize;
@property (nonatomic) int width;
@property (nonatomic) int height;
@property (nonatomic) float rotation;

@property (nonatomic) NSNumber *venueid;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *subtype;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *shortlabel;
@property (nonatomic) NSArray  *nodeList;

- (id)initWithMapId:(NSNumber *)mapId;
- (NSNumber *)routeNodeIdWithPoi:(NSNumber *)poiid;
- (NSDictionary *)tileWithZoom:(int)zoom X:(int)x Y:(int)y;
- (CGPoint)pointOfNode:(NSNumber *)nodeId InMap:(NSNumber *)mapId;
- (NSArray *)nodesWithMap:(NSNumber *)mapid;
- (NSArray *)venues;

- (NSArray *)distanceList:(NSNumber *)venueid;
- (NSArray *)distanceLayerList:(NSNumber *)mapId;
- (NSArray *)distanceListWithMapId:(NSNumber *)mapid node1Id:(NSNumber *)node1id;//新增方法，通过已知的nodeid查表

+ (NSDictionary *)venueWithPoiId:(NSNumber *)poiId;
+ (NSDictionary *)venueWithId:(NSNumber *)venueId;
+ (NSArray *)nodeDistanceListOfVenue:(NSNumber *)venueid;
+ (NSNumber *)venueIdWithPoiId:(NSNumber *)poiId;
+ (PointOfInterest *)maindoorPoiOfVenue:(NSNumber *)venueId;
+ (VenuePoint *)venuePointWithId:(NSNumber *)venueId;
+ (NSArray *)searchPoiWithKeyword:(NSString *)key;
+ (NSArray *)searchVenueWithKeyword:(NSString *)key;
+ (PointOfInterest *)poiOfId:(NSNumber *)poiId;
+ (NSArray *)allVenues;
+ (NSArray *)overviewMapOfVenues:(NSNumber *)venueId;
+ (NSArray *)floorviewMapOfVenues:(NSNumber *)venueId;
+ (NSDictionary *)firstNonOverOfVenues:(NSNumber *)venueId;
+ (NSArray *)poiListWithVenueId:(NSNumber *)venueId;
+ (NSArray *)poiListWithMapId:(NSNumber *)mapId;
+ (RouteNode *)nodeWithId:(NSNumber *)nodeId;
+ (RouteNode *)nodeWithId:(NSNumber *)nodeId InMap:(NSNumber *)mapId;
+ (NSArray *)poiListWithVenueId:(NSNumber *)venueId MapId:(NSNumber *)mapId;

@end
