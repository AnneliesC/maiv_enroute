//
//  RushChallengesDetailViewController.h
//  enroute
//
//  Created by Gilles Van de Ven on 13/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RushChallengesDetailView.h"
#import "RushChallenge.h"

@interface RushChallengesDetailViewController : UIViewController<UINavigationControllerDelegate>

@property (nonatomic,strong) RushChallengesDetailView *view;
@property (nonatomic,strong) RushChallenge *rushChallenge;

- (id)initWithRushChallenge:(RushChallenge *)rushChallenge;

@end
