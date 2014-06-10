//
//  MenuViewController.m
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[MenuView alloc]initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    [self.view.btnThemas addTarget:self action:@selector(ThemasScreen:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnLogout addTarget:self action:@selector(LogoutScreen:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)ThemasScreen:(id)sender{
    
    MainViewController *mainVC = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:mainVC animated:NO];
    
}
-(void)LogoutScreen:(id)sender{
    
    NSLog(@"[MENU]Logout");
    
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn2"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLoggedIn2"] == NO){
        self.loginVC = [[LoginViewController alloc]initWithBounds:self.view.bounds];
        [self presentViewController:self.loginVC animated:NO completion:^{}];
    }
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
