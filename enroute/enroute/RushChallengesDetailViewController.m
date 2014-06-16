//
//  RushChallengesDetailViewController.m
//  enroute
//
//  Created by Gilles Van de Ven on 13/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "RushChallengesDetailViewController.h"

@interface RushChallengesDetailViewController ()

@end

@implementation RushChallengesDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationController.navigationBarHidden = NO;
        
    }
    return self;
}

- (id)initWithRushChallenge:(RushChallenge *)rushChallenge{
    
    self.rushChallenge = rushChallenge;
    return [self initWithNibName:nil bundle:nil];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[RushChallengesDetailView alloc]initWithFrame:bounds andRushChallenge:self.rushChallenge];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBarHidden = NO;
    
    [self.view.btnRush addTarget:self action:@selector(pushRush:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnBack addTarget:self action:@selector(showPrevious:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
}

-(void)pushRush:(id)sender{
    
    DataParser *dataParser = [[DataParser alloc] init];
    [dataParser uploadRushChallengeWithGroupId:[[[AppModel sharedModel] groupId] intValue]
                                   challengeId:(int)self.rushChallenge.identifier
                                   andDuration:(int)(self.view.slider.value + 0.5)];
}

-(void)showPrevious:(id)sender{
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
//    if([[AppModel sharedModel] rushChallengePushed] == YES){
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"SHOW_MENU" object:self];
//    }
}

-(void)sliderChanged:(id)sneder{
    int value = (int)(self.view.slider.value + 0.5);
    self.view.duration.text = [NSString stringWithFormat:@"%i",value];
    self.view.duration.center = CGPointMake([self mapValue:(double)self.view.slider.value fromInputStart:5 inputEnd:20 outputStart:0 outputEnd:215] + 53,295/2);
}

- (double)mapValue:(double)value fromInputStart:(double)inputStart inputEnd:(double)inputEnd outputStart:(double)outputStart outputEnd:(double)outputEnd{
    double inputRange = inputEnd - inputStart;
    double outputRange = outputEnd - outputStart;
    return ((value - inputStart)*outputRange / inputRange + outputStart);
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
