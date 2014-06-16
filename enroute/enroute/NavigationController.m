//
//  NavigationController.m
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@property(nonatomic,strong) DataParser *dataParser;
@property(nonatomic,strong) LoadingViewController *loadingVC;
@property(nonatomic,strong) MenuViewController *menuVC;
@property(nonatomic,strong) MainViewController *mainVC;
@property(nonatomic,strong) CompassViewController *compassVC;
@property(nonatomic,strong) UploadViewController *uploadVC;
@property(nonatomic,strong) OverviewViewController *overviewVC;
@property(nonatomic,strong) RushChallengesViewController *rushChallengesVC;
@property(nonatomic,strong) RushChallengesDetailViewController *rushChallengesDetailVC;
@property(nonatomic,strong) RushViewController *rushVC;
@property(nonatomic,strong) ChallengeViewController *challengeVC;

@property(nonatomic, copy) NSArray *viewControllers;

@property (strong, nonatomic) PTPusher *client;

@end

@implementation NavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _client = [PTPusher pusherWithKey:@"7b08d4ece4550c8194f8" delegate:self encrypted:YES];
        PTPusherChannel *channel = [_client subscribeToChannelNamed:@"maiv"];
        [channel bindToEventNamed:@"rush_challenge" handleWithBlock:^(PTPusherEvent *channelEvent) {
            NSDictionary *data = [channelEvent.data objectForKey:@"rush_challenge"];
            
            RushChallenge *rushChallenge = [[RushChallenge alloc] init];
            rushChallenge.identifier = [[data objectForKey:@"id"] intValue];
            rushChallenge.title = [data objectForKey:@"title"];
            rushChallenge.info = [data objectForKey:@"info"];
            rushChallenge.duration = [[data objectForKey:@"duration"] intValue];
            rushChallenge.timePushed = [Helpers getCurrentDate];
            [[AppModel sharedModel] setRushChallenge:rushChallenge];
        }];
        [_client connect];
        
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showRush:) name:@"SHOW_RUSH" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showOverview:) name:@"SHOW_OVERVIEW" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showRushChallenge:) name:@"SHOW_RUSHCHALLENGE" object:nil];
}

-(void)showMenu:(id)sender{
    [self goTo:self.menuVC];
}

-(void)showThemes:(id)sender{
    [self goTo:self.mainVC];
}

-(void)showCompass:(id)sender{
    [self goTo:self.compassVC];
}

-(void)showUpload:(id)sender{
    [self goTo:self.uploadVC];
}

-(void)showRush:(id)sender{
    if([[AppModel sharedModel] isMentor] == NO || [[AppModel sharedModel] rushChallengePushed] == YES){
        [self goTo:self.rushVC];
    }else{
        [self goTo:self.rushChallengesVC];
    }
}

-(void)showChallenge:(id)sender{
    self.challengeVC = [[ChallengeViewController alloc] initWithChallenge:self.compassVC.selectedChallenge];
    [self goTo:self.challengeVC];
}

-(void)showOverview:(id)sender{
    [self goTo:self.overviewVC];
}

-(void)showRushChallenge:(id)sender{
    self.rushChallengesDetailVC = [[RushChallengesDetailViewController alloc] initWithRushChallenge:self.rushChallengesVC.view.rushChallengesTVC.selectedRushChallenge];
    [self goTo:self.rushChallengesDetailVC];
}

-(void)logout:(id)sender{
    [self goTo:self.mainVC];
    self.navigationBarHidden = YES;
    [self.mainVC logout];
}

-(void)showLoginRegister:(id)sender{
    [self goTo:self.mainVC];
}

-(void)loadAppData:(id)sender{
    NSLog(@"[NavigationController] Load app data");
    
    [self goTo:self.loadingVC];
    [self.dataParser loadAppData];
}

-(void)appDataLoaded:(id)sender{
    NSLog(@"[NavigationController] App data loaded");
    
    [self initViewControllers];
    [self setMenuEvents];
    [self goTo:self.mainVC];
    
    if([[AppModel sharedModel] isMentor] == NO){
        [self.mainVC showIntro];
    }
}

-(void)goTo:(UIViewController*)viewController{

    if([self.viewControllers objectAtIndex:[self.viewControllers count]-1] != viewController){
        self.viewControllers = [[NSArray alloc] initWithObjects:[self.viewControllers objectAtIndex:[self.viewControllers count]-1], viewController, nil];
    }
}

-(void)initViewControllers{
    
    self.menuVC = [[MenuViewController alloc] initWithNibName:nil bundle:nil];
    self.compassVC = [[CompassViewController alloc] initWithNibName:nil bundle:nil];
    
    self.uploadVC = [[UploadViewController alloc] initWithNibName:nil bundle:nil];
    self.rushVC = [[RushViewController alloc] initWithNibName:nil bundle:nil];

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
    [self.compassVC.view.btnChallenge addTarget:self action:@selector(showChallenge:) forControlEvents:UIControlEventTouchUpInside];
    
    //adim
    [self.menuVC.view.btnOverview addTarget:self action:@selector(showOverview:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SHOW_MENU" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SHOW_THEMES" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SHOW_OVERVIEW" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SHOW_RUSH" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GROUPS_LOADED" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"USER_LOADED" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"APP_DATA_LOADED" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SHOW_RUSHCHALLENGE" object:nil];
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
