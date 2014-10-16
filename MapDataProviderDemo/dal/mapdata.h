//
//  mapdata.h
//  Map
//
//  Created by Wingman on 14-5-21.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dbEngine.h"

@interface mapdata : dbEngine

- (NSDictionary *)mapDataWithMapId:(NSNumber *)mapid;

@end
