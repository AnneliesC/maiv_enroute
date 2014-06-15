//
//  RushChallengesDetailView.h
//  enroute
//
//  Created by Gilles Van de Ven on 13/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RushChallenge.h"

@interface RushChallengesDetailView : UIView

@property (nonatomic,strong) UIButton *btnBack;
@property (nonatomic,strong) UIButton *btnRush;
@property (nonatomic,strong) UISlider *slider;
@property (nonatomic,strong) UILabel *duration;

- (id)initWithFrame:(CGRect)frame andRushChallenge:(RushChallenge*)rushChallenge;

@end
