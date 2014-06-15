//
//  ChallengeView.m
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "ChallengeView.h"

@implementation ChallengeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        //terug
        UIImage *btnBackImage = [UIImage imageNamed:@"Button_back"];
        self.btnBack= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnBack.frame=CGRectMake(0, 502, btnBackImage.size.width, btnBackImage.size.height);
        [self.btnBack setBackgroundImage:btnBackImage forState:UIControlStateNormal];
        [self.btnBack setTitle:@"" forState:UIControlStateNormal];
        [self addSubview:self.btnBack];
        
        //rush
        UIImage *btnStartImage = [UIImage imageNamed:@"Button_start"];
        self.btnStart= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnStart.frame=CGRectMake(160, 502, btnStartImage.size.width, btnStartImage.size.height);
        [self.btnStart setBackgroundImage:btnStartImage forState:UIControlStateNormal];
        [self.btnStart setTitle:@"" forState:UIControlStateNormal];
        [self addSubview:self.btnStart];
        
        UIImage *woodenBeamImage = [UIImage imageNamed:@"woodenBeam"];
        self.woodenBeam = [[UIImageView alloc]initWithImage:woodenBeamImage];
        self.woodenBeam.frame=CGRectMake(0,493, woodenBeamImage.size.width, woodenBeamImage.size.height);
        [self addSubview:self.woodenBeam];

        
        
        
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
