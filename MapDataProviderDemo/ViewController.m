//
//  ViewController.m
//  MapDataProviderDemo
//
//  Created by 贺东 on 10/15/14.
//  Copyright (c) 2014 person_dd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mapdataprovider = [[MapDataProvider alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getIdAction:(id)sender {
    _mapdataprovider = [[MapDataProvider alloc]initWithVenueId:[NSNumber numberWithInt:_venueId.text.intValue] MapId:[NSNumber numberWithInt:_mapId.text.intValue]];
    [_mapdataprovider nodes];
}

- (IBAction)getNodeIdAction:(id)sender {
    [_mapdataprovider node:[NSNumber numberWithInt:_node1Id.text.intValue] isConnectedWithNode:[NSNumber numberWithInt:_node2Id.text.intValue]];
    
}
@end
