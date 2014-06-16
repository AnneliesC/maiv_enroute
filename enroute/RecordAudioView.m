
//
//  RecordAudioView.m
//  enroute
//
//  Created by Annelies Clauwaert on 16/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "RecordAudioView.h"

@implementation RecordAudioView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // background
        UIImage *audioBackgroundImage = [UIImage imageNamed:@"audioBackground"];
        UIImageView *audioBackground= [[UIImageView alloc] initWithImage:audioBackgroundImage];
        audioBackground.frame = CGRectMake(0, self.frame.size.height - audioBackgroundImage.size.height,
                                             audioBackgroundImage.size.width, audioBackgroundImage.size.height);
        [self addSubview:audioBackground];
        
        self.timerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.timerLabel.font = [UIFont fontWithName:@"SportsWorld" size:38];
        self.timerLabel.textColor = [UIColor colorWithRed:70/255.0f green:94/255.0f blue:106/255.0f alpha:1];
        self.timerLabel.text = @"00:00:00";
        [self.timerLabel sizeToFit];
        self.timerLabel.center = CGPointMake(self.frame.size.width/2, 150/2);
        [audioBackground addSubview:self.timerLabel];
        
        UIImage *toolbarBackgroundImage = [UIImage imageNamed:@"toolBarBackground"];
        UIImageView *toolbarBackground= [[UIImageView alloc] initWithImage:toolbarBackgroundImage];
        toolbarBackground.frame = CGRectMake(0, self.frame.size.height - toolbarBackgroundImage.size.height,
                                             toolbarBackgroundImage.size.width, toolbarBackgroundImage.size.height);
        [self addSubview:toolbarBackground];
        
        // back
        UIImage *btnBackImage = [UIImage imageNamed:@"Button_back"];
        self.btnBack= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnBack.frame=CGRectMake(0, 502, btnBackImage.size.width, btnBackImage.size.height);
        [self.btnBack setBackgroundImage:btnBackImage forState:UIControlStateNormal];
        [self.btnBack setTitle:@"" forState:UIControlStateNormal];
        [self addSubview:self.btnBack];
        
        // rush
        UIImage *btnStartImage = [UIImage imageNamed:@"saveButton"];
        self.btnStart= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnStart.frame=CGRectMake(160, self.frame.size.height - btnStartImage.size.height, btnStartImage.size.width, btnStartImage.size.height);
        [self.btnStart setBackgroundImage:btnStartImage forState:UIControlStateNormal];
        [self.btnStart setTitle:@"" forState:UIControlStateNormal];
        self.btnStart.enabled = FALSE;
        [self addSubview:self.btnStart];
        
        UIImage *woodenBeamImage = [UIImage imageNamed:@"woodenBeam"];
        UIImageView *woodenBeam = [[UIImageView alloc]initWithImage:woodenBeamImage];
        woodenBeam.frame=CGRectMake(0,493, woodenBeamImage.size.width, woodenBeamImage.size.height);
        [self addSubview:woodenBeam];
        
        // audio record start
        UIImage *btnAudioRecordImage = [UIImage imageNamed:@"audioRecordButton"];
        self.btnAudioRecord= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnAudioRecord.frame=CGRectMake(0, 0, btnAudioRecordImage.size.width, btnAudioRecordImage.size.height);
        self.btnAudioRecord.center = CGPointMake(self.frame.size.width/2, audioBackground.frame.origin.y);
        [self.btnAudioRecord setBackgroundImage:btnAudioRecordImage forState:UIControlStateNormal];
        [self.btnAudioRecord setTitle:@"" forState:UIControlStateNormal];
        self.btnAudioRecord.hidden = FALSE;
        self.btnAudioRecord.enabled = TRUE;
        [self addSubview:self.btnAudioRecord];
        
        // audio record stop
        UIImage *btnAudioStopImage = [UIImage imageNamed:@"audioStopButton"];
        self.btnAudioStop= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnAudioStop.frame=CGRectMake(0, 0, btnAudioStopImage.size.width, btnAudioStopImage.size.height);
        self.btnAudioStop.center = CGPointMake(self.frame.size.width/2, audioBackground.frame.origin.y);
        [self.btnAudioStop setBackgroundImage:btnAudioStopImage forState:UIControlStateNormal];
        [self.btnAudioStop setTitle:@"" forState:UIControlStateNormal];
        self.btnAudioStop.hidden = TRUE;
        self.btnAudioStop.enabled = FALSE;
        [self addSubview:self.btnAudioStop];
        
        // audio play
        UIImage *btnRecorderPlayImage = [UIImage imageNamed:@"recordPlayButton"];
        UIImage *btnRecorderPlayDisabledImage = [UIImage imageNamed:@"recordPlayDisabledButton"];
        self.btnRecorderPlayButton= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnRecorderPlayButton.frame=CGRectMake(0, 0, btnRecorderPlayImage.size.width, btnRecorderPlayImage.size.height);
        self.btnRecorderPlayButton.center = CGPointMake(454/2, audioBackground.frame.origin.y);
        [self.btnRecorderPlayButton setBackgroundImage:btnRecorderPlayImage forState:UIControlStateNormal];
        [self.btnRecorderPlayButton setBackgroundImage:btnRecorderPlayDisabledImage forState:UIControlStateDisabled];
        [self.btnRecorderPlayButton setTitle:@"" forState:UIControlStateNormal];
        [self.btnRecorderPlayButton setTitle:@"" forState:UIControlStateDisabled];
        self.btnRecorderPlayButton.enabled = FALSE;
        [self addSubview:self.btnRecorderPlayButton];
        
        // audio stop
        UIImage *btnRecorderStopImage = [UIImage imageNamed:@"recordStopButton"];
        UIImage *btnRecorderStopDisabledImage = [UIImage imageNamed:@"recordStopDisabledButton"];
        self.btnRecorderStopButton= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnRecorderStopButton.frame=CGRectMake(0, 0, btnRecorderStopImage.size.width, btnRecorderStopImage.size.height);
        self.btnRecorderStopButton.center = CGPointMake(186/2, audioBackground.frame.origin.y);
        [self.btnRecorderStopButton setBackgroundImage:btnRecorderStopImage forState:UIControlStateNormal];
        [self.btnRecorderStopButton setBackgroundImage:btnRecorderStopDisabledImage forState:UIControlStateDisabled];
        [self.btnRecorderStopButton setTitle:@"" forState:UIControlStateNormal];
        [self.btnRecorderStopButton setTitle:@"" forState:UIControlStateDisabled];
        self.btnRecorderStopButton.enabled = FALSE;
        [self addSubview:self.btnRecorderStopButton];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
