//
//  MapViewController.m
//  Demo
//
//  Created by Prabhakaran, Hariprasad on 7/15/15.
//  Copyright (c) 2015 Hari. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.frame = self.view.bounds;
    self.mapView.autoresizingMask = self.view.autoresizingMask;
    self.mapView.delegate = self;
    
    [self initializeMap];
    [self APIcall];
}

-(void)viewWillAppear:(BOOL)animated{
    //UIScreen *screen=[UIScreen mainScreen];
    //[self.mapView setBounds:screen.bounds];
}

-(void) initializeMap{
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
}

-(void)markBoundariesOfCity:(NSString *)city subtitle:(NSString *)subtitle{
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder geocodeAddressString:city completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark* aPlacemark in placemarks)
        {
            //NSLog(@"Got Placemark : %@", aPlacemark);
            CLLocation *plotLocation = aPlacemark.location;
            CLLocationCoordinate2D coordinate = plotLocation.coordinate;
            //NSLog(@"markBoundaries: Latitude %f", coordinate.latitude);
            //NSLog(@"markBoundaries: Longitude %f", coordinate.longitude);
            [self dropPinAtLatitude:coordinate.latitude longitude:coordinate.longitude title:city subtitle:subtitle];
        }
    }];
}

-(void)dropPinAtLatitude:(float) latitude longitude:(float)longitude title:(NSString *) title subtitle:(NSString *) subtitle {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    MKPointAnnotation *anotationPoint = [[MKPointAnnotation alloc] init];
    anotationPoint.coordinate = coordinate;
    anotationPoint.title = title;
    anotationPoint.subtitle = subtitle;
    [self.mapView addAnnotation:anotationPoint];
}

-(void)dropManyPins:(NSArray *) pins{
    [self.mapView addAnnotations:pins];
}

-(void) setRegionAtLatitude:(float) latitude long:(float) longitude{
    float map_span_delta = 0.6;
    MKCoordinateRegion region;
    
    region.center.latitude=latitude;
    region.center.longitude=longitude;
    region.span.latitudeDelta=map_span_delta;
    region.span.longitudeDelta=map_span_delta;
    [self.mapView setRegion:(region) animated:(YES)];
}

-(void) setRegionOfPlace:(NSString*) place{
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder geocodeAddressString:place completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark* aPlacemark in placemarks)
        {
            CLLocation *plotLocation = aPlacemark.location;
            CLLocationCoordinate2D coordinate = plotLocation.coordinate;
            [self setRegionAtLatitude:coordinate.latitude long:coordinate.longitude];
        }
    }];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString* AnnotationIdentifier = @"Annotation";
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
    if (!pinView) {
        MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
        if ([annotation.subtitle isEqualToString:@"green"]){
            customPinView.image = [UIImage imageNamed:@"greenDot.png"];
        }
        else if([annotation.subtitle isEqualToString:@"yellow"]){
            customPinView.image = [UIImage imageNamed:@"yellowDot.png"];
        }
        else if([annotation.subtitle isEqualToString:@"orange"]){
            customPinView.image = [UIImage imageNamed:@"orangeDot.png"];
        }
        else if([annotation.subtitle isEqualToString:@"red"]){
            customPinView.image = [UIImage imageNamed:@"redDot.png"];
        }
        else{
            customPinView.image = [UIImage imageNamed:@"bluePin.png"];
        }
        customPinView.animatesDrop = NO;
        customPinView.canShowCallout = YES;
        return customPinView;
        
    } else {
        pinView.annotation = annotation;
    }
    
    return pinView;
}

// API CALL Module
-(void) APIcall{
    //A variable to hold error details, if something errors.
    NSError *apiError = nil;

    // Prepare the URL string
    NSString *urlString = [NSString stringWithFormat:@"http://localhost:3001/?id=%@",[self.choiceValue stringByReplacingOccurrencesOfString:@" " withString:@"%20"] ];
    
    // Define the URL and HTTP methods
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *apiRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [apiRequest setHTTPMethod:@"GET"];
    
    // DEBUG: Logging Request URL
    // NSLog(@"APIrequest: %@", urlString);
    
    // Call the API
    NSData *apiResponse = [NSURLConnection sendSynchronousRequest:apiRequest returningResponse:nil error:&apiError];
    if (apiError != nil) {
        NSLog(@"API response error: %@", apiError);
    } // API Call failed
    else{
        NSArray *response = [NSJSONSerialization JSONObjectWithData:apiResponse options:0 error:nil];
        NSLog(@"[MapViewController] RAW JSON RESPONSE: %@ ",response);
        
        if (apiError != nil) {
            NSLog(@"JSON Parse error: %@", apiError);
        }
        else{
            // Parse the JSON ARRAY RESPONSE
            NSMutableArray *annotations=[[NSMutableArray alloc] init];
            CLLocationCoordinate2D coordinate;
            MKPointAnnotation *anotationPoint;
            
            for (NSDictionary *diction in response) {
                NSDictionary *location = [diction objectForKey:@"location"];
                NSString *name = [location objectForKey:@"name"];
                NSString *color = [location objectForKey:@"color"];
                float lat = [[location objectForKey:@"lat"] floatValue];
                float lng = [[location objectForKey:@"long"] floatValue];
                
                anotationPoint = [[MKPointAnnotation alloc] init];
                coordinate = CLLocationCoordinate2DMake(lat, lng);
                anotationPoint.coordinate = coordinate;
                anotationPoint.title = name;
                anotationPoint.subtitle = color;

                [annotations addObject:anotationPoint];
                //NSLog(@"[MapViewController] JSON response for request [%@]: [%f]",self.choiceValue,lng);
                NSLog(@"[MapViewController] added [%@] annotation for [%@]: [%f],[%f]",anotationPoint.subtitle,anotationPoint.title,lat,lng);
            }

            //Clear all the previous annotations
            [self.mapView removeAnnotations:self.mapView.annotations];
            [self setRegionOfPlace:self.choiceValue];

            NSLog(@"No of places:%lu", (unsigned long)annotations.count);
            [self.mapView addAnnotations:annotations];
        }
    } // Successful API call
    
}// END OF API CALL Module
@end
