//
//  NavigationController.h
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Pusher/Pusher.h>
#import "NavigationBar.h"
#import "MenuViewController.h"
#import "MainViewController.h"
#import "LoadingViewController.h"
#import "DataParser.h"
#import "Helpers.h"

#import "CompassViewController.h"
#import "UploadViewController.h"
#import "OverviewViewController.h"
#import "RushChallengesViewController.h"
#import "RushChallengesDetailViewController.h"
#import "RushViewController.h"
#import "ChallengeViewController.h"

@interface NavigationController : UINavigationController<PTPusherDelegate>


@end
