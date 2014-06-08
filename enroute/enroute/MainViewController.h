//
//  MainViewController.h
//  enroute
//
//  Created by Gilles Van de Ven on 7/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "AppModel.h"
#import "LoginViewController.h"
#import "DataObjectFactory.h"
#import "Group.h"

#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@interface MainViewController : UIViewController

@property (nonatomic,strong) MainView *view;
@property (nonatomic,strong) LoginViewController *loginVC;

@end
