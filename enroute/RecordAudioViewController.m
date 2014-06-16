//
//  RecordAudioViewController.m
//  enroute
//
//  Created by Annelies Clauwaert on 16/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "RecordAudioViewController.h"

@interface RecordAudioViewController ()

@property (strong, nonatomic) AVAudioPlayer *player;

@property (nonatomic) int seconds;

@end

@implementation RecordAudioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationController.navigationBarHidden = NO;
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[RecordAudioView alloc]initWithFrame:bounds];
    
    [self.view.btnBack addTarget:self action:@selector(showPrevious:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)showPrevious:(id)sender{
    [[self navigationController] popViewControllerAnimated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBarHidden = NO;
    
    [self.view.btnAudioRecord addTarget:self action:@selector(recordButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnAudioStop addTarget:self action:@selector(recordStopButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnRecorderPlayButton addTarget:self action:@selector(PlayTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnRecorderStopButton addTarget:self action:@selector(StopTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Set audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"audio.m4a",
                               nil];
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    self.recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:NULL];
    self.recorder.delegate = self;
    self.recorder.meteringEnabled = YES;
    [self.recorder prepareToRecord];
}

-(void)recordButtonTapped:(id)sender{
    NSLog(@"[RecordAudioVC] Record tapped");
    
    if (self.player.playing) {
        [self.player stop];
    }
    
    if (!self.recorder.recording) {
        NSLog(@"[RecordAudioVC] Recording started/resumed");
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimerLabel:) userInfo:nil repeats:YES];
        
        // AudioSession
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        
        // Start recording
        [self.recorder record];
        
        self.view.btnAudioRecord.hidden = TRUE;
        self.view.btnAudioRecord.enabled = FALSE;
        
        self.view.btnAudioStop.hidden = FALSE;
        self.view.btnAudioStop.enabled = TRUE;
        
        self.view.btnRecorderPlayButton.enabled = FALSE;
        self.view.btnRecorderStopButton.enabled = FALSE;
    }
    
}

-(void)recordStopButtonTapped:(id)sender{
    NSLog(@"[RecordAudioVC] Record stop tapped");
    
    if (self.player.playing) {
        [self.player stop];
    }
    
    if (self.recorder.recording) {
        NSLog(@"[RecordAudioVC] Recording stopped");
        
        [self.timer invalidate];
        self.timer = nil;
        
        // Recorden pauzeren
        [self.recorder pause];
        
        self.view.btnAudioRecord.hidden = FALSE;
        self.view.btnAudioRecord.enabled = TRUE;
        
        self.view.btnAudioStop.hidden = TRUE;
        self.view.btnAudioStop.enabled = FALSE;
        
        self.view.btnRecorderPlayButton.enabled = TRUE;
        self.view.btnRecorderStopButton.enabled = TRUE;
        
        self.view.btnStart.enabled = TRUE;
    } 
}

-(void)PlayTapped:(id)sender{
    NSLog(@"[RecordAudioVC] Play tapped");
    
    if (!self.recorder.recording){
        
        if(!self.player){
            [self.recorder stop];
            
            AVAudioSession *audioSession = [AVAudioSession sharedInstance];
            [audioSession setActive:NO error:nil];
            
            self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.recorder.url error:nil];
            [self.player setDelegate:self];
            self.player.volume = 1;
        }
        
        if(!self.player.isPlaying){
            NSLog(@"[RecordAudioVC] Play audio");
            self.view.btnRecorderPlayButton.enabled = FALSE;
            self.view.btnRecorderStopButton.enabled = TRUE;
            [self.player play];
        }
    }

}

-(void)StopTapped:(id)sender{
    NSLog(@"[RecordAudioVC] Stop tapped");
    
    if (!self.recorder.recording){
        
        if(self.player.isPlaying){
            self.view.btnRecorderPlayButton.enabled = TRUE;
            self.view.btnRecorderStopButton.enabled = FALSE;
        }
    }
}

-(void)updateTimerLabel:(id)sender{
    NSLog(@"[RecordAudioVC] Update timer label");
    
    self.seconds = self.seconds + 1;
    
    int minutes = self.seconds/60;
    int seconds = self.seconds - (minutes * 60);

    NSString *minutesText = [NSString stringWithFormat:@"%i",minutes];
    NSString *secondsText = [NSString stringWithFormat:@"%i",seconds];
    
    if(minutesText.length == 1) minutesText = [NSString stringWithFormat:@"0%@",minutesText];
    if(secondsText.length == 1) secondsText = [NSString stringWithFormat:@"0%@",secondsText];
    
    NSString *labelText = [NSString stringWithFormat:@"00:%@:%@",minutesText,secondsText];
    self.view.timerLabel.text = labelText;
    [self.view.timerLabel sizeToFit];

}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    self.view.btnRecorderPlayButton.enabled = TRUE;
    self.view.btnRecorderStopButton.enabled = FALSE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
