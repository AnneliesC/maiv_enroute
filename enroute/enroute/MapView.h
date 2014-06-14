//
//  MapView.h
//  enroute
//
//  Created by Annelies Clauwaert on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RMMapView.h>
#import <RMMapboxSource.h>
#import <RMCircleAnnotation.h>
#import "Challenge.h"

@interface MapView : UIView

@property (nonatomic,strong) RMMapView *mapView;

@end
