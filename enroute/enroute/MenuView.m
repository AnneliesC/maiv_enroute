//
//  MenuView.m
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        UIImage *imageFrame = [UIImage imageNamed:@"Menu_middenFrame"];
        self.frameImage = [[UIImageView alloc]initWithImage:imageFrame];
        self.frameImage.frame=CGRectMake(60, 8, self.frameImage.frame.size.width, self.frameImage.frame.size.height);
        self.frameImage.alpha=0;
        [self addSubview:self.frameImage];
        
        UIImage *woodenBeam1Image = [UIImage imageNamed:@"Menu_balk2"];
        self.woodenBeam1 = [[UIImageView alloc]initWithImage:woodenBeam1Image];
        self.woodenBeam1.frame=CGRectMake(60, 35, woodenBeam1Image.size.width, woodenBeam1Image.size.height);
        [self addSubview:self.woodenBeam1];
        
        UIImage *woodenBeam2Image = [UIImage imageNamed:@"Menu_balk1"];
        self.woodenBeam2 = [[UIImageView alloc]initWithImage:woodenBeam2Image];
        self.woodenBeam2.frame=CGRectMake(60, 221, woodenBeam2Image.size.width, woodenBeam2Image.size.height);
        self.woodenBeam2.alpha=0;
        [self addSubview:self.woodenBeam2];
        
        UIImage *bird1Image = [UIImage imageNamed:@"Menu_bird1"];
        self.Bird1 = [[UIImageView alloc]initWithImage:bird1Image];
        self.Bird1.frame=CGRectMake(291/2,100, bird1Image.size.width, bird1Image.size.height);
        [self addSubview:self.Bird1];
        
        UIImage *bird2Image = [UIImage imageNamed:@"Menu_bird2"];
        self.Bird2 = [[UIImageView alloc]initWithImage:bird2Image];
        self.Bird2.frame=CGRectMake(174,100, bird2Image.size.width, bird2Image.size.height);
        [self addSubview:self.Bird2];
        
        [self createButtons];
        
        
        
        
        
        if([[AppModel sharedModel] isMentor] == YES){
            [self createButtonsAdim];
        }else{
            [self createButtonsUser];
        }
        
        
        
        
    }
    return self;
}
-(void)animateImages{
    
    NSLog(@"nnananana");
    [UIView animateWithDuration:0.5
                          delay:0.5
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self.woodenBeam1 setFrame:CGRectMake(60, 145, self.woodenBeam1.frame.size.width, self.woodenBeam1.frame.size.height)];
                         
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                         self.woodenBeam2.alpha=1;
                         
                     }];
    
    [UIView animateWithDuration:0.5
                          delay:1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         [self.woodenBeam2 setFrame:CGRectMake(60, 450, self.woodenBeam2.frame.size.width, self.woodenBeam2.frame.size.height)];
                         [self.frameImage setFrame:CGRectMake(60, 230, self.frameImage.frame.size.width, self.frameImage.frame.size.height)];
                         self.frameImage.alpha=1;
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                     }];
    
    [UIView animateWithDuration:0.5
                          delay:1.6
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         [self.Bird1 setFrame:CGRectMake(291/2, 191, self.Bird1.frame.size.width, self.Bird1.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                     }];
    
    [UIView animateWithDuration:0.5
                          delay:1.8
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         [self.Bird2 setFrame:CGRectMake(174, 187, self.Bird2.frame.size.width, self.Bird2.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                     }];
    
    
    [UIView animateWithDuration:0.4
                          delay:1.5
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         [self.btnLogout setFrame:CGRectMake(33, 465, self.btnLogout.frame.size.width, self.btnLogout.frame.size.height)];
                         self.btnLogout.alpha=1;
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                     }];
    
    [UIView animateWithDuration:0.5
                          delay:1.5
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         [self.btnCompass setFrame:CGRectMake(33, 250, self.btnCompass.frame.size.width, self.btnCompass.frame.size.height)];
                         self.btnCompass.alpha=1;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                     }];
    
    [UIView animateWithDuration:0.5
                          delay:1.7
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         [self.btnThemes setFrame:CGRectMake(173, 250, self.btnThemes.frame.size.width, self.btnThemes.frame.size.height)];
                         self.btnThemes.alpha=1;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                     }];
    
    [UIView animateWithDuration:0.5
                          delay:1.9
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         [self.btnUpload setFrame:CGRectMake(33, 351, self.btnUpload.frame.size.width, self.btnUpload.frame.size.height)];
                         self.btnUpload.alpha=1;
                         
                         [self.btnOverview setFrame:CGRectMake(33, 351, self.btnOverview.frame.size.width, self.btnOverview.frame.size.height)];
                         self.btnOverview.alpha=1;
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                     }];
    
    [UIView animateWithDuration:0.5
                          delay:2.1
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         [self.btnRush setFrame:CGRectMake(173, 351, self.btnRush.frame.size.width, self.btnRush.frame.size.height)];
                         self.btnRush.alpha=1;
                         
                         
                         
                         [self.btnRushChallenges setFrame:CGRectMake(173, 351, self.btnRushChallenges.frame.size.width, self.btnRushChallenges.frame.size.height)];
                         self.btnRushChallenges.alpha=1;
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                     }];
    
}

-(void)createButtons{
    
    //kompas
    UIImage *btnCompassImage = [UIImage imageNamed:@"NavigationCompass"];
    self.btnCompass= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnCompass.frame=CGRectMake(33, 220, btnCompassImage.size.width, btnCompassImage.size.height);
    [self.btnCompass setBackgroundImage:btnCompassImage forState:UIControlStateNormal];
    [self.btnCompass setTitle:@"" forState:UIControlStateNormal];
    self.btnCompass.alpha=0;
    [self addSubview:self.btnCompass];
    
    //thema
    UIImage *btnThemesImage = [UIImage imageNamed:@"NavigationThemes"];
    self.btnThemes= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnThemes.frame=CGRectMake(173, 220, btnThemesImage.size.width, btnThemesImage.size.height);
    [self.btnThemes setBackgroundImage:btnThemesImage forState:UIControlStateNormal];
    [self.btnThemes setTitle:@"" forState:UIControlStateNormal];
    self.btnThemes.alpha=0;
    [self addSubview:self.btnThemes];
    
    //logout
    UIImage *btnLogoutImage = [UIImage imageNamed:@"Menu_logout"];
    self.btnLogout= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogout.frame=CGRectMake(33, 450, btnLogoutImage.size.width, btnLogoutImage.size.height);
    [self.btnLogout setBackgroundImage:btnLogoutImage forState:UIControlStateNormal];
    [self.btnLogout setTitle:@"" forState:UIControlStateNormal];
    self.btnLogout.alpha=0;
    [self addSubview:self.btnLogout];
}

-(void)createButtonsUser{
    
    // Upload
    UIImage *btnUploadImage = [UIImage imageNamed:@"NavigationUpload"];
    self.btnUpload= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnUpload.frame=CGRectMake(33, 320, btnUploadImage.size.width, btnUploadImage.size.height);
    [self.btnUpload setBackgroundImage:btnUploadImage forState:UIControlStateNormal];
    [self.btnUpload setTitle:@"" forState:UIControlStateNormal];
    self.btnUpload.alpha=0;
    [self addSubview:self.btnUpload];
    
    // Rush
    UIImage *btnRushImage = [UIImage imageNamed:@"NavigationRush"];
    self.btnRush= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRush.frame=CGRectMake(173, 320, btnRushImage.size.width, btnRushImage.size.height);
    [self.btnRush setBackgroundImage:btnRushImage forState:UIControlStateNormal];
    [self.btnRush setTitle:@"" forState:UIControlStateNormal];
    self.btnRush.alpha=0;
    [self addSubview:self.btnRush];
}

-(void)createButtonsAdim{
    
    // Overview
    UIImage *btnOverviewImage = [UIImage imageNamed:@"NavigationOverview"];
    self.btnOverview= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnOverview.frame=CGRectMake(33, 320, btnOverviewImage.size.width, btnOverviewImage.size.height);
    [self.btnOverview setBackgroundImage:btnOverviewImage forState:UIControlStateNormal];
    [self.btnOverview setTitle:@"" forState:UIControlStateNormal];
    self.btnOverview.alpha=0;
    [self addSubview:self.btnOverview];
    
    // RushChallenges
    UIImage *btnRushImage = [UIImage imageNamed:@"NavigationRush"];
    self.btnRushChallenges = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRushChallenges.frame=CGRectMake(173, 320, btnRushImage.size.width, btnRushImage.size.height);
    [self.btnRushChallenges setBackgroundImage:btnRushImage forState:UIControlStateNormal];
    [self.btnRushChallenges setTitle:@"" forState:UIControlStateNormal];
    self.btnRushChallenges.alpha=0;
    [self addSubview:self.btnRushChallenges];
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
