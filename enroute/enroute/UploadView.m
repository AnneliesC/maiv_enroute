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
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"User_background"]];
        
        self.scrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 250,self.frame.size.width, self.frame.size.height)];
        self.scrollView.backgroundColor=[UIColor redColor];
        [self addSubview:self.scrollView];
        
        UIImage *BirdOnStickImage = [UIImage imageNamed:@"User_bird"];
        self.birdOnStick = [[UIImageView alloc]initWithImage:BirdOnStickImage];
        self.birdOnStick.frame=CGRectMake(0, 210, BirdOnStickImage.size.width, BirdOnStickImage.size.height);
        [self addSubview:self.birdOnStick];
        
        
        
        
        
    }
    
    self.scrollView.contentSize = CGSizeMake(0, self.frame.size.height);
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    self.scrollView.pagingEnabled = YES;
    
    
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
