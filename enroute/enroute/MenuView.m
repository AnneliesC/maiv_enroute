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
        
    }
    return self;
}
-(void)createButtons{

    //themas
    UIImage *backgroundButtonThema = [UIImage imageNamed:@"Menu_item"];
    
    self.btnThemes= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnThemes.frame=CGRectMake(33, 250, backgroundButtonThema.size.width, backgroundButtonThema.size.height);
    [self.btnThemes setBackgroundImage:backgroundButtonThema forState:UIControlStateNormal];
    [self.btnThemes setTitle:@"Themas" forState:UIControlStateNormal];
    [self addSubview:self.btnThemes];
    
    //Map
    UIImage *backgroundButtonMap = [UIImage imageNamed:@"Menu_item"];
    
    self.btnCompass= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnCompass.frame=CGRectMake(173, 250, backgroundButtonMap.size.width, backgroundButtonMap.size.height);
    [self.btnCompass setBackgroundImage:backgroundButtonMap forState:UIControlStateNormal];
    [self.btnCompass setTitle:@"Map" forState:UIControlStateNormal];
    [self addSubview:self.btnCompass];

    //Opdrachten
    UIImage *backgroundButtonOpdrachten = [UIImage imageNamed:@"Menu_item"];
    
    self.btnRush= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRush.frame=CGRectMake(33, 351, backgroundButtonOpdrachten.size.width, backgroundButtonOpdrachten.size.height);
    [self.btnRush setBackgroundImage:backgroundButtonOpdrachten forState:UIControlStateNormal];
    [self.btnRush setTitle:@"Opdrachten" forState:UIControlStateNormal];
    [self addSubview:self.btnRush];
    
    //Gebruiker
    UIImage *backgroundButtonGebruiker = [UIImage imageNamed:@"Menu_item"];
    
    self.btnResults= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnResults.frame=CGRectMake(173, 351, backgroundButtonGebruiker.size.width, backgroundButtonGebruiker.size.height);
    [self.btnResults setBackgroundImage:backgroundButtonGebruiker forState:UIControlStateNormal];
    [self.btnResults setTitle:@"Gebruiker" forState:UIControlStateNormal];
    [self addSubview:self.btnResults];
    
    
    //logout
    UIImage *backgroundButtonLogout = [UIImage imageNamed:@"Menu_logout"];
    
    self.btnLogout= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogout.frame=CGRectMake(33, 493, backgroundButtonLogout.size.width, backgroundButtonLogout.size.height);
    [self.btnLogout setBackgroundImage:backgroundButtonLogout forState:UIControlStateNormal];
    [self.btnLogout setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnLogout];
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
