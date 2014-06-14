//
//  UploadView.m
//  enroute
//
//  Created by Gilles Van de Ven on 11/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "UploadView.h"

@implementation UploadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.scrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 250,self.frame.size.width, 319)];
        [self addSubview:self.scrollView];
        
        UIImage *BirdOnStickImage = [UIImage imageNamed:@"User_bird"];
        self.birdOnStick = [[UIImageView alloc]initWithImage:BirdOnStickImage];
        self.birdOnStick.frame=CGRectMake(0, 210, BirdOnStickImage.size.width, BirdOnStickImage.size.height);
        [self addSubview:self.birdOnStick];
        
        int xPos = 0;
        int yPos = -160;
        
        for (int j = 0; j < 10; j++) {
            
            for (int i = 0; i < 3; i++) {
                
                NSLog(@"ik haat u");
                
                UIImage *UkelderImage = [UIImage imageNamed:@"User_resultButton"];
                self.UKelder = [[UIImageView alloc]initWithImage:UkelderImage];
                self.UKelder.frame=CGRectMake(xPos, yPos, UkelderImage.size.width, UkelderImage.size.height);
                [self.scrollView addSubview:self.UKelder];
                
                xPos+=UkelderImage.size.width;
            }
        
            xPos=0;
            yPos+=self.UKelder.frame.size.height;
        }
        
        self.scrollView.contentSize = CGSizeMake(0, yPos);
        [self.scrollView setShowsVerticalScrollIndicator:NO];
        
        
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
