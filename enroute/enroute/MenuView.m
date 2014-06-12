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
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
        
        UIImage *imageFrame = [UIImage imageNamed:@"Menu_frame"];
        self.frameImage = [[UIImageView alloc]initWithImage:imageFrame];
        [self addSubview:self.frameImage];
        
        [self createButtons];
        
        NSLog(@"ADMIN? %d",[[AppModel sharedModel] isMentor] == YES);
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
    UIImage *backgroundButtonThema = [UIImage imageNamed:@"Menu_kompas"];
    
    self.btnCompass= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnCompass.frame=CGRectMake(33, 250, backgroundButtonThema.size.width, backgroundButtonThema.size.height);
    [self.btnCompass setBackgroundImage:backgroundButtonThema forState:UIControlStateNormal];
    [self.btnCompass setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnCompass];
    
    //thema
    UIImage *backgroundButtonMap = [UIImage imageNamed:@"Menu_themas"];
    
    self.btnThemes= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnThemes.frame=CGRectMake(173, 250, backgroundButtonMap.size.width, backgroundButtonMap.size.height);
    [self.btnThemes setBackgroundImage:backgroundButtonMap forState:UIControlStateNormal];
    [self.btnThemes setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnThemes];
    
    //logout
    UIImage *backgroundButtonLogout = [UIImage imageNamed:@"Menu_logout"];
    
    self.btnLogout= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogout.frame=CGRectMake(33, 493, backgroundButtonLogout.size.width, backgroundButtonLogout.size.height);
    [self.btnLogout setBackgroundImage:backgroundButtonLogout forState:UIControlStateNormal];
    [self.btnLogout setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnLogout];
}
-(void)createButtonsUser{

    //Gebruiker
    UIImage *backgroundButtonOpdrachten = [UIImage imageNamed:@"Menu_upload"];
    
    self.btnUpload= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnUpload.frame=CGRectMake(33, 351, backgroundButtonOpdrachten.size.width, backgroundButtonOpdrachten.size.height);
    [self.btnUpload setBackgroundImage:backgroundButtonOpdrachten forState:UIControlStateNormal];
    [self.btnUpload setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnUpload];
    
    //Rush
    UIImage *backgroundButtonGebruiker = [UIImage imageNamed:@"Menu_rush"];
    
    self.btnRush= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRush.frame=CGRectMake(173, 351, backgroundButtonGebruiker.size.width, backgroundButtonGebruiker.size.height);
    [self.btnRush setBackgroundImage:backgroundButtonGebruiker forState:UIControlStateNormal];
    [self.btnRush setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnRush];
    
}
-(void)createButtonsAdim{
    
    //Kinderen
    UIImage *backgroundButtonOpdrachten = [UIImage imageNamed:@"Menu_Admin"];
    
    self.btnChildren= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnChildren.frame=CGRectMake(33, 351, backgroundButtonOpdrachten.size.width, backgroundButtonOpdrachten.size.height);
    [self.btnChildren setBackgroundImage:backgroundButtonOpdrachten forState:UIControlStateNormal];
    [self.btnChildren setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnChildren];
    
    //RushOpdracht
    UIImage *backgroundButtonGebruiker = [UIImage imageNamed:@"Menu_rush"];
    
    self.btnRushOpdrachten= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRushOpdrachten.frame=CGRectMake(173, 351, backgroundButtonGebruiker.size.width, backgroundButtonGebruiker.size.height);
    [self.btnRushOpdrachten setBackgroundImage:backgroundButtonGebruiker forState:UIControlStateNormal];
    [self.btnRushOpdrachten setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnRushOpdrachten];
    
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
