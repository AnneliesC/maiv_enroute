//
//  MenuView.h
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"

#import <QuartzCore/QuartzCore.h>

@interface MenuView : UIView

@property (nonatomic,strong) UIImageView *frameImage;

@property (nonatomic,strong) UIButton *btnThemes;
@property (nonatomic,strong) UIButton *btnCompass;
@property (nonatomic,strong) UIButton *btnRush;
@property (nonatomic,strong) UIButton *btnUpload;

@property (nonatomic,strong) UIButton *btnOverview;
@property (nonatomic,strong) UIButton *btnRushChallenges;

@property (nonatomic,strong) UIButton *btnLogout;





@property (nonatomic,strong) UIImageView *woodenBeam1;
@property (nonatomic,strong) UIImageView *woodenBeam2;
@property (nonatomic,strong) UIImageView *Bird1;
@property (nonatomic,strong) UIImageView *Bird2;

@property (nonatomic,strong) CAShapeLayer *frameLinesMask;


-(void)animateImages;



@end