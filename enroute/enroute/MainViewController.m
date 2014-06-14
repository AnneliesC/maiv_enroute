//
//  MainViewController.m
//  enroute
//
//  Created by Gilles Van de Ven on 7/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    self.view = [[MainView alloc]initWithFrame:bounds];
}

- (void)viewDidLoad{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    [self showLoginRegister];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBarHidden = NO;
    self.view.scrollView.delegate=self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    int index = (scrollView.contentOffset.x / scrollView.frame.size.width);
    self.view.pageControl.currentPage = index;
}

-(void)viewDidAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)showLoginRegister{
    NSLog(@"[MainVC] Show login & register");
    
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn2"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLoggedIn2"] == NO){
        self.loginVC = [[LoginViewController alloc]initWithBounds:self.view.bounds];
        [self presentViewController:self.loginVC animated:NO completion:^{}];
    }
}

-(void)logout{
    NSLog(@"[MainVC] logout");
    
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn2"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLoggedIn2"] == NO){
        self.loginVC = [[LoginViewController alloc]initWithBounds:self.view.bounds];
        [self presentViewController:self.loginVC animated:NO completion:^{}];
    }
}

-(void)showIntro{
    NSLog(@"[MainVC] Show intro");
    self.introVC = [[IntroViewController alloc]initWithBounds:self.view.bounds];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self presentViewController:self.introVC animated:NO completion:^{}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
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
