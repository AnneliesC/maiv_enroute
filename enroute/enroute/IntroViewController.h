//
//  IntroViewController.h
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntroView.h"

@interface IntroViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic,strong) IntroView *view;

-(instancetype)initWithBounds:(CGRect)bounds;

@end
