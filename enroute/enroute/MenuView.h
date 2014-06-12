//
//  MenuView.h
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"


@interface MenuView : UIView

@property (nonatomic,strong) UIImageView *frameImage;

@property (nonatomic,strong) UIButton *btnThemes;
@property (nonatomic,strong) UIButton *btnCompass;


@property (nonatomic,strong) UIButton *btnRush;
@property (nonatomic,strong) UIButton *btnUpload;

@property (nonatomic,strong) UIButton *btnChildren;
@property (nonatomic,strong) UIButton *btnRushOpdrachten;




@property (nonatomic,strong) UIButton *btnLogout;


@end
