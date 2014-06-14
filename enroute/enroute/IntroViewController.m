//
//  IntroViewController.m
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "IntroViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(instancetype)initWithBounds:(CGRect)bounds{
    return [self initWithNibName:nil bundle:nil];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[IntroView alloc]initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBarHidden = NO;
    self.view.scrollView.delegate=self;
    
    [self.view.btnFinishIntro addTarget:self action:@selector(closeIntro:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)closeIntro:(id)sender{
    [self dismissViewControllerAnimated:NO completion:^{}];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    int index = (scrollView.contentOffset.x / scrollView.frame.size.width);
    self.view.pageControl.currentPage = index;
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
