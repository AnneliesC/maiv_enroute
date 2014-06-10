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

@interface MainViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic,strong) MainView *view;
@property (nonatomic,strong) LoginViewController *loginVC;

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
-(void)showLoginRegister;
-(void)logout;

@end
