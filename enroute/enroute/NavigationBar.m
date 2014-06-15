//
//  NavigationBar.m
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "NavigationBar.h"

const CGFloat VFSNavigationBarHeightIncrease = 98.f;

@implementation NavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setShadowImage:[UIImage new]];
        
        [self setBackgroundImage:[UIImage imageNamed:@"Header_background"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        self.translucent = YES;
        self.opaque = NO;

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createHeader:) name:@"USER_LOADED" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showRushButton:) name:@"RUSH_CHALLENGE_LOADED" object:nil];
        
    }
    return self;
}



-(void)initButtonEvents{
    [self.btnMenu addTarget:self action:@selector(menuButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnOverview addTarget:self action:@selector(overviewButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnRush addTarget:self action:@selector(rushButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnLogo addTarget:self action:@selector(logoButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)menuButtonTapped:(id)sender{
     [[NSNotificationCenter defaultCenter] postNotificationName:@"SHOW_MENU" object:self];
}
-(void)overviewButtonTapped:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SHOW_OVERVIEW" object:self];
}
-(void)rushButtonTapped:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SHOW_RUSH" object:self];
}
-(void)logoButtonTapped:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SHOW_THEMES" object:self];
}

/*
-(id)init{
    self = [super init];
    return self;
}

-(void)initButtons:(NavigationController*)sender{
    [self.btnMenu addTarget:sender action:@selector(menuScreen:) forControlEvents:UIControlEventTouchUpInside];
}
 */

-(void)createHeader:(id)sender{
    
    //Knop Menu
    
    UIImage *backgroundButtonMenu = [UIImage imageNamed:@"Header_menu"];
    
    self.btnMenu= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnMenu.frame=CGRectMake(0, 6.5, backgroundButtonMenu.size.width, backgroundButtonMenu.size.height);
    [self.btnMenu setBackgroundImage:backgroundButtonMenu forState:UIControlStateNormal];
    [self.btnMenu setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnMenu];
    
    
    if([[AppModel sharedModel] isMentor] == YES){
    
        UIImage *backgroundButtonOverview = [UIImage imageNamed:@"Header_overview"];
        
        self.btnOverview= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnOverview.frame=CGRectMake(160, 6.5, backgroundButtonOverview.size.width, backgroundButtonOverview.size.height);
        [self.btnOverview setBackgroundImage:backgroundButtonOverview forState:UIControlStateNormal];
        [self.btnOverview setTitle:@"" forState:UIControlStateNormal];
        [self addSubview:self.btnOverview];
    
    }else{
        
        UIImage *backgroundButtonRush = [UIImage imageNamed:@"Header_rush"];
        
        self.btnRush= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnRush.frame=CGRectMake(160, 6.5, backgroundButtonRush.size.width, backgroundButtonRush.size.height);
        [self.btnRush setBackgroundImage:backgroundButtonRush forState:UIControlStateNormal];
        [self.btnRush setTitle:@"" forState:UIControlStateNormal];
        self.btnRush.enabled = NO;

        [self addSubview:self.btnRush];
    }
    
    UIImage *woodenBeamImage = [UIImage imageNamed:@"woodenBeam"];
    self.woodenBeam = [[UIImageView alloc]initWithImage:woodenBeamImage];
    self.woodenBeam.frame=CGRectMake(0, 108, woodenBeamImage.size.width, woodenBeamImage.size.height);
    [self addSubview:self.woodenBeam];
    
    //Knop Logo
    
    UIImage *backgroundButtonLogo = [UIImage imageNamed:@"Header_logo"];
    
    self.btnLogo= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogo.frame=CGRectMake(176/2, 20, backgroundButtonLogo.size.width, backgroundButtonLogo.size.height);
    [self.btnLogo setBackgroundImage:backgroundButtonLogo forState:UIControlStateNormal];
    [self.btnLogo setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnLogo];
    
    
    
    [self initButtonEvents];
}

-(void)showRushButton:(id)sender{
    
////    self.btnRush.alpha = 0.3;
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//    
//    [UIView setAnimationDuration:0.8];
////    self.btnRush.alpha = 0.3;
//    
//    [UIView commitAnimations];
//    self.btnRush.enabled = NO;

}

- (CGSize)sizeThatFits:(CGSize)size {
    
    CGSize amendedSize = [super sizeThatFits:size];
    amendedSize.height += VFSNavigationBarHeightIncrease;
    
    return amendedSize;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"USER_LOADED" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"RUSH_CHALLENGE_LOADED" object:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
