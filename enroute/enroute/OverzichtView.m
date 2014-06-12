//
//  OverzichtView.m
//  enroute
//
//  Created by Gilles Van de Ven on 12/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "OverzichtView.h"

@implementation OverzichtView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        NSLog(@"HIER?");
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Kaart_background"]];
        
        UIImage *backgroundButtonOpdrachten = [UIImage imageNamed:@"Kaart_locatie"];
        
        self.btnLocatie= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnLocatie.frame=CGRectMake(0, 502, backgroundButtonOpdrachten.size.width, backgroundButtonOpdrachten.size.height);
        [self.btnLocatie setBackgroundImage:backgroundButtonOpdrachten forState:UIControlStateNormal];
        [self.btnLocatie setTitle:@"" forState:UIControlStateNormal];
        [self addSubview:self.btnLocatie];
        
        
        UIImage *imagehouteBalk = [UIImage imageNamed:@"houte_balk"];
        self.houteBalkImage = [[UIImageView alloc]initWithImage:imagehouteBalk];
        self.houteBalkImage.frame=CGRectMake(0, 495, imagehouteBalk.size.width, imagehouteBalk.size.height);
        [self addSubview:self.houteBalkImage];
        
        
        
        
    }
    return self;
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
