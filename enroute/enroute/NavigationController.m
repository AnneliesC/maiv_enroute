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
        
        self.loadingVC = [[LoadingViewController alloc] initWithNibName:nil bundle:nil];
        self.mainVC = [[MainViewController alloc] initWithNibName:nil bundle:nil];

        self.dataParser = [[DataParser alloc] init];
        [self.dataParser loadGroupsData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showLoginRegister:) name:@"GROUPS_LOADED" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadAppData:) name:@"USER_LOADED" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDataLoaded:) name:@"APP_DATA_LOADED" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMenu:) name:@"SHOW_MENU" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showThemes:) name:@"SHOW_THEMES" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showRushChallenge:) name:@"SHOW_RUSHCHALLENGE" object:nil];
    
}

-(void)showMenu:(id)sender{
    self.viewControllers = [[NSArray alloc] initWithObjects:self.menuVC, nil];
}

-(void)showThemes:(id)sender{
    NSLog(@"[NavigationController] Themes");
    self.viewControllers = [[NSArray alloc] initWithObjects:self.mainVC, nil];
}

-(void)showCompass:(id)sender{
    NSLog(@"[NavigationController] Compass");
    self.viewControllers = [[NSArray alloc] initWithObjects:self.compassVC, nil];
}

-(void)showUpload:(id)sender{
    NSLog(@"[NavigationController] Upload");
    self.viewControllers = [[NSArray alloc] initWithObjects:self.uploadVC, nil];
}

-(void)showRush:(id)sender{
    
    
    
}

-(void)showOverview:(id)sender{
    NSLog(@"[NavigationController] Overview");
    self.viewControllers = [[NSArray alloc] initWithObjects:self.overviewVC, nil];
}

-(void)showRushChallenges:(id)sender{
    NSLog(@"[NavigationController] Rush challenges");
    self.viewControllers = [[NSArray alloc] initWithObjects:self.rushChallengesVC, nil];
    
}

-(void)showRushChallenge:(id)sender{
    
    NSLog(@"Ma gij kunt zagen ze !");
}

-(void)logout:(id)sender{
    NSLog(@"[NavigationController] Logout");
    self.viewControllers = [[NSArray alloc] initWithObjects:self.mainVC, nil];
    
    self.navigationBarHidden = YES;
    [self.mainVC logout];
}


-(void)showLoginRegister:(id)sender{
    self.viewControllers = [[NSArray alloc] initWithObjects:self.mainVC, nil];
}

-(void)loadAppData:(id)sender{
    NSLog(@"[NavigationController] Load app data");
    [self initViewControllers];
    [self setMenuEvents];
    self.viewControllers = [[NSArray alloc] initWithObjects:self.loadingVC, nil];
    [self.dataParser loadAppData];
}

-(void)appDataLoaded:(id)sender{
    NSLog(@"[NavigationController] App data loaded");
    self.viewControllers = [[NSArray alloc] initWithObjects:self.mainVC, nil];
}

-(void)initViewControllers{
    
    self.menuVC = [[MenuViewController alloc] initWithNibName:nil bundle:nil];
    self.compassVC = [[CompassViewController alloc] initWithNibName:nil bundle:nil];
    
    
    self.uploadVC = [[UploadViewController alloc] initWithNibName:nil bundle:nil];
    
    
    self.overviewVC = [[OverviewViewController alloc] initWithNibName:nil bundle:nil];
    self.rushChallengesVC = [[RushChallengesViewController alloc] initWithNibName:nil bundle:nil];
    
}

-(void)setMenuEvents{
    
    //knoppen
    [self.menuVC.view.btnThemes addTarget:self action:@selector(showThemes:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuVC.view.btnCompass addTarget:self action:@selector(showCompass:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuVC.view.btnLogout addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    
    //gebruiker
    [self.menuVC.view.btnUpload addTarget:self action:@selector(showUpload:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuVC.view.btnRush addTarget:self action:@selector(showRush:) forControlEvents:UIControlEventTouchUpInside];
    
    //adim
    [self.menuVC.view.btnOverview addTarget:self action:@selector(showOverview:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuVC.view.btnRushChallenges addTarget:self action:@selector(showRushChallenges:) forControlEvents:UIControlEventTouchUpInside];
    
    //[self.menuVC.view.btnChildren addTarget:self action:@selector(showResults:) forControlEvents:UIControlEventTouchUpInside];
    //[self.menuVC.view.btnRushOpdrachten addTarget:self action:@selector(showResults:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SHOW_MENU" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SHOW_RUSHCHALLENGE" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SHOW_THEMES" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GROUPS_LOADED" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"USER_LOADED" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"APP_DATA_LOADED" object:nil];
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
