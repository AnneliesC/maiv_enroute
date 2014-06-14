//
//  MapView.m
//  enroute
//
//  Created by Annelies Clauwaert on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"[MapView]");
        
        RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"anneliesclauwaert.if44g1m7"];
        self.mapView = [[RMMapView alloc] initWithFrame:frame andTilesource:source];
        self.mapView = [[RMMapView alloc] initWithFrame:frame andTilesource:source
                                       centerCoordinate:CLLocationCoordinate2DMake(50.821990f, 3.258457f)
                                              zoomLevel:15.0f
                                           maxZoomLevel:15.0f
                                           minZoomLevel:15.0f
                                        backgroundImage:nil];
        
        self.mapView.zoom = 15.0f;
        self.userInteractionEnabled = NO;
        [self.mapView removeAllCachedImages];
        self.mapView.userTrackingMode = RMUserTrackingModeFollowWithHeading;
        self.mapView.adjustTilesForRetinaDisplay = YES;
        self.mapView.showsUserLocation = YES;
        
        [self addSubview:self.mapView];
        
        CAShapeLayer *circle = [CAShapeLayer layer];
        circle.fillColor = [UIColor redColor].CGColor;
        circle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0, 212, 212)].CGPath;
        circle.position = CGPointMake((self.frame.size.width/2)-(circle.frame.size.width/2),
                                      (self.frame.size.height/2)-(circle.frame.size.height/2));
        circle.bounds = CGRectMake(0, 0, 212, 212);
        self.mapView.layer.mask = circle;
        
        //[self addAnnotations];

    }
    return self;
}

- (void)addAnnotations{
    NSLog(@"[MapView] Add annonations");
    
    RMCircleAnnotation *annotation = [[RMCircleAnnotation alloc] initWithMapView:self.mapView centerCoordinate:CLLocationCoordinate2DMake(50.819295, 3.274161
                                                                                                                                          ) radiusInMeters:70];
    [annotation setFillColor:[UIColor redColor]];
    [annotation setLineWidth:0];
    [self.mapView addAnnotation:annotation];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
