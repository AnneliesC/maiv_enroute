//
//  RushViewController.m
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "RushViewController.h"

@interface RushViewController ()

@end

@implementation RushViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.navigationController.navigationBarHidden = NO;
        //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rushPushed:) name:@"RUSH_CHALLENGE_LOADED" object:nil];
    }
    
    return self;
}

- (id)initWithRushChallenge:(RushChallenge *)rushChallenge{
    
    self.rushChallenge = rushChallenge;
    return [self initWithNibName:nil bundle:nil];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[RushView alloc]initWithFrame:bounds andRushChallenge:self.rushChallenge];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBarHidden = NO;
    
    if(self.rushChallenge){
        NSLog(@"[RushVC] init with rush");
        [self showRush];
    }
    
    [self.view.btnBack addTarget:self action:@selector(showPrevious:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)rushPushed:(id)sender{
    [self showRush];
}

-(void)showRush{
    self.view.rushChallenge = [[AppModel sharedModel] rushChallenge];
    [self.view updateView];
    self.timer = [[NSTimer alloc] init];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimerLabel:) userInfo:nil repeats:YES];
    [self.view.btnStart addTarget:self action:@selector(challengeDone:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)updateTimerLabel:(id)sender{

    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timePushedString = self.rushChallenge.timePushed;
    NSDate *timePushed = [formatter dateFromString:timePushedString];
    
    NSDate *currentTime = [Helpers getCurrentTime];
    
    int duration = (int)self.rushChallenge.duration * 60;
    int timeDifference = duration - [currentTime timeIntervalSinceDate:timePushed];
    
    int minutes = timeDifference/60;
    int seconds = timeDifference - (minutes * 60);
    
    if(timeDifference < 3*60) self.view.timerLabel.textColor = [UIColor colorWithRed:252/255.0f green:105/255.0f blue:97/255.0f alpha:1];
    if(timeDifference <= 0){
        [self.timer invalidate];
        self.view.timerLabel.text = @"00:00:00";
        self.view.btnStart.enabled = FALSE;
    }
    
    NSString *minutesText = [NSString stringWithFormat:@"%i",minutes];
    NSString *secondsText = [NSString stringWithFormat:@"%i",seconds];
    
    if(minutesText.length == 1) minutesText = [NSString stringWithFormat:@"0%@",minutesText];
    if(secondsText.length == 1) secondsText = [NSString stringWithFormat:@"0%@",secondsText];
        
    NSString *labelText = [NSString stringWithFormat:@"00:%@:%@",minutesText,secondsText];
    self.view.timerLabel.text = labelText;
    [self.view.timerLabel sizeToFit];
}

-(void)showPrevious:(id)sender{
    [self.timer invalidate];
    [[self navigationController] popViewControllerAnimated:NO];
}

-(void)challengeDone:(id)sender{
    NSLog(@"challenge done");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"RUSH_CHALLENGE_LOADED" object:nil];
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
