//
//  RushView.h
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"

@interface RushView : UIView


@property (nonatomic,strong) UIImageView *woodenBeam;
@property (nonatomic,strong) UIButton *btnBack;
@property (nonatomic,strong) UIButton *btnStart;

@property (nonatomic,strong) UILabel *timerLabel;

-(void)updateView;

@end
