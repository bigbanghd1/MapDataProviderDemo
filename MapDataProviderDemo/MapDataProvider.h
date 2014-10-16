//
//  MapDataProvider.h
//  MapDataProviderDemo
//
//  Created by 贺东 on 10/15/14.
//  Copyright (c) 2014 person_dd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QbengoMapEngine.h"

@interface MapDataProvider : NSObject{
    QbengoMapEngine *_mapengine;
    NSNumber *_venueid;
    NSNumber *_mapid;
}


- (id)initWithVenueId:(NSNumber *)venueid MapId:(NSNumber *)mapid;
- (NSArray *)nodes;
- (BOOL)node:(NSNumber *)nodeid1 isConnectedWithNode:(NSNumber *)nodeid2;
- (void)nodeWithId:(NSNumber *)nodeId;
@end
