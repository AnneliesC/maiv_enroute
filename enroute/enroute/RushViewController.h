//
//  RushViewController.h
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RushView.h"
#import "AppModel.h"
#import "Helpers.h"

@interface RushViewController : UIViewController

@property (nonatomic,strong) RushView *view;
@property (nonatomic,strong) NSTimer *timer;

@end
