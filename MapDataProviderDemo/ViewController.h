//
//  ViewController.h
//  MapDataProviderDemo
//
//  Created by 贺东 on 10/15/14.
//  Copyright (c) 2014 person_dd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapDataProvider.h"

@interface ViewController : UIViewController{
    MapDataProvider *_mapdataprovider;
}
@property (weak, nonatomic) IBOutlet UITextField *venueId;
@property (weak, nonatomic) IBOutlet UITextField *mapId;
@property (weak, nonatomic) IBOutlet UITextField *node1Id;
@property (weak, nonatomic) IBOutlet UITextField *node2Id;
@property (weak, nonatomic) IBOutlet UIButton *getId;
@property (weak, nonatomic) IBOutlet UIButton *getNodeId;

- (IBAction)getIdAction:(id)sender;
- (IBAction)getNodeIdAction:(id)sender;

@end

