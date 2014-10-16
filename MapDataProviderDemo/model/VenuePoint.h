//
//  VenuePoint.h
//  Map
//
//  Created by Wingman on 14-6-26.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VenuePoint : NSObject

@property (nonatomic) NSNumber *venueid;
@property (nonatomic) BOOL hasIndoor;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *desc;
@property (nonatomic) NSString *infoHtml;


- (id)initWithRecord:(NSDictionary *)record;

@end
