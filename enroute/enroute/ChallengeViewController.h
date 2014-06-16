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
#import "RecordAudioViewController.h"
#import "Result.h"
#import "AppModel.h"
#import "DataParser.h"

@interface ChallengeViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) ChallengeView *view;
@property (nonatomic,strong) Challenge *challenge;
@property (nonatomic,strong) RecordAudioViewController *recordAudioVC;

- (id)initWithChallenge:(Challenge *)challenge;

@end
