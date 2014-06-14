//
//  CompassView.h
//  enroute
//
//  Created by Gilles Van de Ven on 11/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Challenge.h"
#import "MapView.h"

@interface CompassView : UIView

@property (nonatomic,strong) UIView *challengeTargetsContainer;
@property (nonatomic,strong) UIButton *btnChallenge;
@property (nonatomic,strong) UIButton *btnCloseButton;
@property (nonatomic,strong) MapView *mapView;
@property (nonatomic,strong) UIView *challengeButtonContainer;

-(void)showChallengeButtonForChallenge:(Challenge*)challenge;
-(void)hideChallengeButton;

@end
