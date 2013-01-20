//
//  TBSecondViewController.h
//  TheBackgrounder
//
//  Created by Gustavo Ambrozio on 19/1/13.
//  Copyright (c) 2013 Gustavo Ambrozio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TBSecondViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentAccuracy;
@property (strong, nonatomic) IBOutlet UISwitch *switchEnabled;

- (IBAction)accuracyChanged:(id)sender;
- (IBAction)enabledStateChanged:(id)sender;

@end
