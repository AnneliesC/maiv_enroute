//
//  RecordAudioViewController.h
//  enroute
//
//  Created by Annelies Clauwaert on 16/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordAudioView.h"
#import <AVFoundation/AVFoundation.h>

@interface RecordAudioViewController : UIViewController<AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (strong, nonatomic) NSURL *outputFileURL;
@property (nonatomic,strong) RecordAudioView *view;
@property (nonatomic,strong) NSTimer *timer;
@property (strong, nonatomic) AVAudioRecorder *recorder;

@end
