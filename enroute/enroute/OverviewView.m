//
//  OverviewView.m
//  enroute
//
//  Created by Annelies Clauwaert on 12/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "OverviewView.h"

@implementation OverviewView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"OverviewBackground"]];
        
        UIImage *backgroundButtonOpdrachten = [UIImage imageNamed:@"OverviewButton"];
        self.btnLocation= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnLocation.frame=CGRectMake(0, 502, backgroundButtonOpdrachten.size.width, backgroundButtonOpdrachten.size.height);
        [self.btnLocation setBackgroundImage:backgroundButtonOpdrachten forState:UIControlStateNormal];
        [self.btnLocation setTitle:@"" forState:UIControlStateNormal];
        [self addSubview:self.btnLocation];
        
        UIImage *woodenBeamImage = [UIImage imageNamed:@"woodenBeam"];
        self.woodenBeam = [[UIImageView alloc]initWithImage:woodenBeamImage];
        self.woodenBeam.frame=CGRectMake(0, 495, woodenBeamImage.size.width, woodenBeamImage.size.height);
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
