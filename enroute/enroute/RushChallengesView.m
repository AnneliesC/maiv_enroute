//
//  RushChallengesView.m
//  enroute
//
//  Created by Gilles Van de Ven on 13/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "RushChallengesView.h"

@implementation RushChallengesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Rush_background"]];
        
        self.rushChallengesTVC =  [[RushChallengesTableViewController alloc]initWithStyle:UITableViewStylePlain];
        self.rushChallengesTVC.view.frame=CGRectMake(0, 345, self.frame.size.width, 223);
        [self addSubview:self.rushChallengesTVC.view];
        
        UIImage *woodenBeamImage = [UIImage imageNamed:@"woodenBeam"];
        self.woodenBeam = [[UIImageView alloc]initWithImage:woodenBeamImage];
        self.woodenBeam.frame=CGRectMake(0, 330, woodenBeamImage.size.width, woodenBeamImage.size.height);
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
