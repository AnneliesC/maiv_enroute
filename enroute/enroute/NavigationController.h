//
//  NavigationController.h
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"
#import "MenuViewController.h"
#import "MainViewController.h"
#import "LoadingViewController.h"
#import "DataParser.h"

@interface NavigationController : UINavigationController

@property(nonatomic,strong) LoadingViewController *loadingVC;
@property(nonatomic,strong) MenuViewController *menuVC;
@property(nonatomic,strong) MainViewController *mainVC;
@property(nonatomic,strong) DataParser *dataParser;

@end
