//
//  QbengoMapEngine.m
//  Map
//
//  Created by Wingman on 14-6-5.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import "QbengoMapEngine.h"
#import "zoomlevel.h"
#import "mapdata.h"
#import "node.h"
#import "poi.h"
#import "map.h"
#import "node_distance.h"
#import "venue.h"

@implementation QbengoMapEngine

- (id)initWithMapId:(NSNumber *)mapId
{
    self = [super init];
    if (self) {
        _mapId = mapId;
        
        NSDictionary *zoomrange = [[zoomlevel new] zoomRangeWithMap:mapId];
        _maxZoom = [[zoomrange objectForKey:@"max_zoom"] intValue];
        _minZoom = [[zoomrange objectForKey:@"min_zoom"] intValue];
        
        NSDictionary *mapData = [[mapdata new] mapDataWithMapId:mapId];
        _tileSize = [[mapData objectForKey:@"tilesize"] intValue];
        _width =    [[mapData objectForKey:@"w"] intValue];
        _height =   [[mapData objectForKey:@"h"] intValue];
        _rotation = [[mapData objectForKey:@"rotation"] floatValue];
        
        NSDictionary *mapRecord = [[map new] mapWithMapId:mapId];
        _venueid =  [mapRecord objectForKey:@"venue_id"];
        _type =     [mapRecord objectForKey:@"type"];
        _subtype =  [mapRecord objectForKey:@"subtype"];
        _name =     [self nameOfMap:mapRecord];
        _shortlabel = [[mapRecord objectForKey:@"floor"] stringValue];
        
        _nodeList = [[node_distance new] distanceLayerList:_mapId];
        
//        NSLog(@"_nodeList=================   %@",_nodeList);
        //[[node_distance new] distanceList:_venueid];
    }
    return self;
}

- (NSString *)nameOfMap:(NSDictionary *)mapRecord
{
    NSString *type = [mapRecord objectForKey:@"type"];
    NSNumber *floor = [mapRecord objectForKey:@"floor"];
    NSString *venueName = [mapRecord objectForKey:@"name"];
    NSString *mapName = nil;
    if ([type isEqualToString:@"overview"]) {
        mapName = [NSString stringWithFormat:@"%@ of %@", type, venueName];
    }
    else
    {
        mapName = [NSString stringWithFormat:@"%@ %@ of %@", type, floor.stringValue, venueName];
    }
    return mapName;
}

- (NSNumber *)routeNodeIdWithPoi:(NSNumber *)poiid
{
    return [[poi new] routeNodeIdWithPoi:poiid];
}

- (NSDictionary *)tileWithZoom:(int)zoom X:(int)x Y:(int)y
{
    NSDictionary *zoomLevel = [[zoomlevel new]zoomLevelWithMap:_mapId Zoom:zoom]; 
    NSNumber *zoomLevelId = [zoomLevel objectForKey:@"id"];
    NSDictionary *tile = [[zoomlevel new] tileWithZoomlevel:zoomLevelId X:x Y:y];
    return tile;
}

+ (NSArray *)searchPoiWithKeyword:(NSString *)key
{
    return [[poi new] search:key];
}

+ (NSArray *)searchVenueWithKeyword:(NSString *)key
{
    return [[venue new] search:key];
}


- (CGPoint)pointOfNode:(NSNumber *)nodeId InMap:(NSNumber *)mapId
{
    NSDictionary *nodeData = [[node new] nodeWithId:nodeId InMap:mapId];
    float x = [[nodeData objectForKey:@"x"] floatValue];
    float y = [[nodeData objectForKey:@"y"] floatValue];
    return CGPointMake(x, y);
}

- (NSArray *)nodesWithMap:(NSNumber *)mapid
{
    return [[node new] nodesWithMap:mapid];
}

- (NSArray *)venues
{
    return [[venue new] venueList];
}

#pragma mark - distance
/*******************************************************************/
- (NSArray *)distanceList:(NSNumber *)venueid{
    return [[node_distance new] distanceList:venueid];
}

- (NSArray *)distanceLayerList:(NSNumber *)mapId{
    return [[node_distance new] distanceLayerList:mapId];
}

- (NSArray *)distanceListWithMapId:(NSNumber *)mapid node1Id:(NSNumber *)node1id{
    
    return [[node_distance new]distanceListWithMapId:mapid node1Id:node1id];
}
/*******************************************************************/

+ (NSArray *)overviewMapOfVenues:(NSNumber *)venueId
{
    return [[map new] overviewMap:venueId];
}

+ (NSArray *)floorviewMapOfVenues:(NSNumber *)venueId
{
    return [[map new] floorMaps:venueId];
}

+ (NSDictionary *)firstNonOverOfVenues:(NSNumber *)venueId
{
    return [[map new] firstNonOverMap:venueId];
}

+ (NSDictionary *)venueWithPoiId:(NSNumber *)poiId
{
    return [[venue new] venueWithPoiId:poiId];
}

+ (NSDictionary *)venueWithId:(NSNumber *)venueId
{
    return [[venue new] venueWithId:venueId];
}

+ (NSNumber *)venueIdWithPoiId:(NSNumber *)poiId
{
    return [[venue new] venueIdWithPoiId:poiId];
}

+ (NSArray *)nodeDistanceListOfVenue:(NSNumber *)venueId
{
    return [[node_distance new] distanceList:venueId];
}

+ (PointOfInterest *)maindoorPoiOfVenue:(NSNumber *)venueId
{
    NSDictionary *maindoor = [[poi new] maindoorOfVenue:venueId];
    return [[PointOfInterest alloc]initWithRecord:maindoor];
}

+ (VenuePoint *)venuePointWithId:(NSNumber *)venueId
{
    NSDictionary *record = [[venue new] venueWithId:venueId];
    return [[VenuePoint alloc]initWithRecord:record];
}

+ (PointOfInterest *)poiOfId:(NSNumber *)poiId
{
    NSDictionary *record = [[poi new] poiWithId:poiId];
    return [[PointOfInterest alloc]initWithRecord:record];
}

+ (NSArray *)allVenues
{
    NSArray *records = [[venue new] venueList];
    NSMutableArray *venues = [[NSMutableArray alloc]initWithCapacity:records.count];
    for (NSDictionary *record in records) {
        VenuePoint *venue = [[VenuePoint alloc]initWithRecord:record];
        [venues addObject:venue];
    }
    return venues;
}

+ (NSArray *)poiListWithVenueId:(NSNumber *)venueId;
{
    NSArray *records = [[poi new] poisWithVenueId:venueId];
    NSMutableArray *pois = [[NSMutableArray alloc]initWithCapacity:records.count];
    for (NSDictionary *record in records) {
        PointOfInterest *poi = [[PointOfInterest alloc] initWithRecord:record];
        [pois addObject:poi];
    }
    return pois;
}

+ (NSArray *)poiListWithMapId:(NSNumber *)mapId
{
    NSArray *records = [[poi new] poisWithMapId:mapId];
    NSMutableArray *pois = [[NSMutableArray alloc]initWithCapacity:records.count];
    for (NSDictionary *record in records) {
        PointOfInterest *poi = [[PointOfInterest alloc] initWithRecord:record];
        [pois addObject:poi];
    }
    return pois;
}

+ (RouteNode *)nodeWithId:(NSNumber *)nodeId
{
    NSDictionary *record = [[node new] nodeWithId:nodeId];
    return [[RouteNode alloc]initWithRecord:record];
}


+ (RouteNode *)nodeWithId:(NSNumber *)nodeId InMap:(NSNumber *)mapId
{
    NSDictionary *record = [[node new] nodeWithId:nodeId InMap:mapId];
    return [[RouteNode alloc]initWithRecord:record];
}

+ (NSArray *)poiListWithVenueId:(NSNumber *)venueId MapId:(NSNumber *)mapId
{
    return [[poi new] poisWithVenueId:venueId MapId:mapId];
}



@end
