//
//  MainView.m
//  enroute
//
//  Created by Gilles Van de Ven on 7/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        NSLog(@"MainView");
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
        
        [self createHeader];
    }
    return self;
}
-(void)createHeader{

    //Knop Menu

    UIImage *backgroundButtonMenu = [UIImage imageNamed:@"Main_menu"];
    
    self.btnMenu= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnMenu.frame=CGRectMake(0, 11/2, backgroundButtonMenu.size.width, backgroundButtonMenu.size.height);
    [self.btnMenu setBackgroundImage:backgroundButtonMenu forState:UIControlStateNormal];
    [self.btnMenu setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnMenu];
    
    //Knop Rush

    UIImage *backgroundButtonRush = [UIImage imageNamed:@"Main_rush"];
    
    self.btnRush= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRush.frame=CGRectMake(160, 11/2, backgroundButtonRush.size.width, backgroundButtonRush.size.height);
    [self.btnRush setBackgroundImage:backgroundButtonRush forState:UIControlStateNormal];
    [self.btnRush setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnRush];

    
    //Knop Logo
    
    UIImage *backgroundButtonLogo = [UIImage imageNamed:@"Main_logo"];
    
    self.btnLogo= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogo.frame=CGRectMake(176/2, 11/2, backgroundButtonLogo.size.width, backgroundButtonLogo.size.height);
    [self.btnLogo setBackgroundImage:backgroundButtonLogo forState:UIControlStateNormal];
    [self.btnLogo setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnLogo];
    
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
