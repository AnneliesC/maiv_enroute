//
//  LoginViewController.h
//  enroute
//
//  Created by Gilles Van de Ven on 7/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
#import "AppModel.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@interface LoginViewController : UIViewController

@property (nonatomic,strong) LoginView *view;

-(instancetype)initWithBounds:(CGRect)bounds;

@end
