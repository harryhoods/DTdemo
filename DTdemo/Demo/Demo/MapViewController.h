//
//  MapViewController.h
//  Demo
//
//  Created by Prabhakaran, Hariprasad on 7/15/15.
//  Copyright (c) 2015 Hari. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBookUI/AddressBookUI.h>
#import <Mapkit/Mapkit.h>

@interface MapViewController :UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>{
}

@property(nonatomic) NSString *choiceValue;
-(void) initializeMap;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
