//
//  OverviewView.h
//  enroute
//
//  Created by Annelies Clauwaert on 12/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RMMapView.h>
#import <RMMapboxSource.h>
#import <RMPointAnnotation.h>

@interface OverviewView : UIView

@property (nonatomic,strong) UIImageView *woodenBeam;
@property (nonatomic,strong) UIButton *btnLocation;
@property (nonatomic,strong) RMMapView *mapView;

@end
