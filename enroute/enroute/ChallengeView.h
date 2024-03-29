//
//  ChallengeView.h
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Challenge.h"
#import "AppModel.h"

@interface ChallengeView : UIView

@property (nonatomic,strong) UIButton *btnBack;
@property (nonatomic,strong) UIButton *btnStart;

- (id)initWithFrame:(CGRect)frame andChallenge:(Challenge*)challenge;

@end
