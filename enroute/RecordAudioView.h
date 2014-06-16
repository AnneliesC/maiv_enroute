//
//  RecordAudioView.h
//  enroute
//
//  Created by Annelies Clauwaert on 16/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordAudioView : UIView

@property (nonatomic,strong) UIButton *btnBack;
@property (nonatomic,strong) UIButton *btnStart;
@property (nonatomic,strong) UIButton *btnAudioRecord;
@property (nonatomic,strong) UIButton *btnAudioStop;
@property (nonatomic,strong) UIButton *btnRecorderPlayButton;
@property (nonatomic,strong) UIButton *btnRecorderStopButton;

@property (nonatomic,strong) UILabel *timerLabel;

@end
