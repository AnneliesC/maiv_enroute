//
//  AppDelegate.h
//  enroute
//
//  Created by Annelies Clauwaert on 6/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"
#import "NavigationController.h"
#import "LoadingViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoadingViewController *loadingVC;
@property (strong, nonatomic) NavigationBar *customNavigationBar;
@property (strong, nonatomic) NavigationController *navigationController;

@end
