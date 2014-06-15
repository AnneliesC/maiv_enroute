//
//  ChallengeViewController.h
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeView.h"
#import "Challenge.h"

@interface ChallengeViewController : UIViewController

@property (nonatomic,strong) ChallengeView *view;
@property (nonatomic,strong) Challenge *challenge;

- (id)initWithChallenge:(Challenge *)challenge;

@end
