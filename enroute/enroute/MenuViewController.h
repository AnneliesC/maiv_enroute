//
//  MenuViewController.h
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"
#import "MainViewController.h"
#import "LoginViewController.h"



@interface MenuViewController : UIViewController

@property (nonatomic,strong) MenuView *view;
@property (nonatomic,strong) LoginViewController *loginVC;

@end
