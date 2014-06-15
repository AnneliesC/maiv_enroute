//
//  CompassViewController.h
//  enroute
//
//  Created by Gilles Van de Ven on 11/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompassView.h"
#import <CoreLocation/CoreLocation.h>
#import "AppModel.h"
#import "Challenge.h"
#import "ChallengeTarget.h"

@interface CompassViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic,strong) Challenge *selectedChallenge;
@property (nonatomic,strong) CompassView *view;

@end
