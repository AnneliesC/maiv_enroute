//
//  NavigationController.m
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.navigationController.navigationBar.backItem.hidesBackButton = false;
    
    // Do any additional setup after loading the view.
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuScreen:) name:@"SHOW_MENU" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themaScreen:) name:@"SHOW_THEMAS" object:nil];

    
}
-(void)menuScreen:(id)sender{

    MenuViewController *menuVC = [[MenuViewController alloc] initWithNibName:nil bundle:nil];
    //[self pushViewController:menuVC animated:NO];
    self.viewControllers = [[NSArray alloc] initWithObjects:menuVC, nil];
    
}
-(void)themaScreen:(id)sender{

    MainViewController *mainVC = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    //[self pushViewController:menuVC animated:NO];
    self.viewControllers = [[NSArray alloc] initWithObjects:mainVC, nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SHOW_MENU" object:nil];
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