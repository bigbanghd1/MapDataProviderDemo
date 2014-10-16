//
//  dbEngine.h
//  Map
//
//  Created by Wingman on 14-5-21.
//  Copyright (c) 2014年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dbEngine : NSObject

- (NSDictionary *)fetchOne:(NSString *)sql;
- (NSArray *)fetchAll:(NSString *)sql;

@end
