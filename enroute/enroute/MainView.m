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
        
        
        self.scrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.scrollView];
        
        self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectZero];
        self.pageControl.numberOfPages = 5;
        self.pageControl.frame = CGRectMake(0, 0, self.pageControl.frame.size.width, self.pageControl.frame.size.height);
        self.pageControl.center = CGPointMake(self.frame.size.width/2, self.frame.size.height - self.pageControl.frame.size.height - 40);
        self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
        self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        [self addSubview:self.pageControl];
        
        
        UIImage *imageUil = [UIImage imageNamed:@"Home_uil"];
        UIImageView *ImageViewUil = [[UIImageView alloc]initWithImage:imageUil];
        ImageViewUil.frame = CGRectMake(self.frame.size.width * 0, -162, imageUil.size.width, imageUil.size.height);
        [self.scrollView addSubview:ImageViewUil];
        
        UIImage *imageMuis = [UIImage imageNamed:@"Home_muis"];
        UIImageView *ImageViewMuis = [[UIImageView alloc]initWithImage:imageMuis];
        ImageViewMuis.frame = CGRectMake(self.frame.size.width * 1, -162, imageMuis.size.width, imageMuis.size.height);
        [self.scrollView addSubview:ImageViewMuis];
        
    }
    
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * 5., 0);
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
