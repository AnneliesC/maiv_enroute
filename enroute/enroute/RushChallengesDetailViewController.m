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
    NSLog(@"dit is een rushchallenge blbalaba: %@",self.rushChallenge.title);
    
    return [self initWithNibName:nil bundle:nil];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[RushChallengesDetailView alloc]initWithFrame:bounds];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBarHidden = NO;
    
    [self.view.btnBack addTarget:self action:@selector(showPrevious:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)showPrevious:(id)sender{
    [[self navigationController] popViewControllerAnimated:YES];
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
