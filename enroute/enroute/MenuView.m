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
        
        UIImage *imageFrame = [UIImage imageNamed:@"Menu_frame"];
        self.frameImage = [[UIImageView alloc]initWithImage:imageFrame];
        [self addSubview:self.frameImage];
        
        [self createButtons];
        
        if([[AppModel sharedModel] isMentor] == YES){
            [self createButtonsAdim];
        }else{
            [self createButtonsUser];
        }
        
    }
    return self;
}

-(void)createButtons{
    
    //kompas
    UIImage *btnCompassImage = [UIImage imageNamed:@"NavigationCompass"];
    self.btnCompass= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnCompass.frame=CGRectMake(33, 250, btnCompassImage.size.width, btnCompassImage.size.height);
    [self.btnCompass setBackgroundImage:btnCompassImage forState:UIControlStateNormal];
    [self.btnCompass setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnCompass];
    
    //thema
    UIImage *btnThemesImage = [UIImage imageNamed:@"NavigationThemes"];
    self.btnThemes= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnThemes.frame=CGRectMake(173, 250, btnThemesImage.size.width, btnThemesImage.size.height);
    [self.btnThemes setBackgroundImage:btnThemesImage forState:UIControlStateNormal];
    [self.btnThemes setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnThemes];
    
    // Rush
    UIImage *btnRushImage = [UIImage imageNamed:@"NavigationRush"];
    self.btnRush= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRush.frame=CGRectMake(173, 351, btnRushImage.size.width, btnRushImage.size.height);
    [self.btnRush setBackgroundImage:btnRushImage forState:UIControlStateNormal];
    [self.btnRush setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnRush];
    
    //logout
    UIImage *btnLogoutImage = [UIImage imageNamed:@"NavigationLogout"];
    self.btnLogout= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogout.frame=CGRectMake(33, 493, btnLogoutImage.size.width, btnLogoutImage.size.height);
    [self.btnLogout setBackgroundImage:btnLogoutImage forState:UIControlStateNormal];
    [self.btnLogout setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnLogout];
    
}

-(void)createButtonsUser{

    // Upload
    UIImage *btnUploadImage = [UIImage imageNamed:@"NavigationUpload"];
    self.btnUpload= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnUpload.frame=CGRectMake(33, 351, btnUploadImage.size.width, btnUploadImage.size.height);
    [self.btnUpload setBackgroundImage:btnUploadImage forState:UIControlStateNormal];
    [self.btnUpload setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnUpload];
}

-(void)createButtonsAdim{
    
    // Overview
    UIImage *btnOverviewImage = [UIImage imageNamed:@"NavigationOverview"];
    self.btnOverview= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnOverview.frame=CGRectMake(33, 351, btnOverviewImage.size.width, btnOverviewImage.size.height);
    [self.btnOverview setBackgroundImage:btnOverviewImage forState:UIControlStateNormal];
    [self.btnOverview setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnOverview];
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
