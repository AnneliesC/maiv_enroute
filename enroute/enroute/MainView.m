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
        
        self.scrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.scrollView];
        
        self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectZero];
        self.pageControl.numberOfPages = 4;
        self.pageControl.frame = CGRectMake(0, 0, self.pageControl.frame.size.width, self.pageControl.frame.size.height);
        self.pageControl.center = CGPointMake(self.frame.size.width/2, self.frame.size.height - self.pageControl.frame.size.height - 40);
        self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
        self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        [self addSubview:self.pageControl];
        
        UIImage *imageUil = [UIImage imageNamed:@"Home_uil"];
        UIImageView *ImageViewUil = [[UIImageView alloc]initWithImage:imageUil];
        ImageViewUil.frame = CGRectMake(self.frame.size.width * 0, -152, imageUil.size.width, imageUil.size.height);
        [self.scrollView addSubview:ImageViewUil];
        
        UIImage *imageMuis = [UIImage imageNamed:@"Home_muis"];
        UIImageView *ImageViewMuis = [[UIImageView alloc]initWithImage:imageMuis];
        ImageViewMuis.frame = CGRectMake(self.frame.size.width * 1, -152, imageMuis.size.width, imageMuis.size.height);
        [self.scrollView addSubview:ImageViewMuis];
    
        UIImage *imageBeer = [UIImage imageNamed:@"Home_beer"];
        UIImageView *ImageViewBeer = [[UIImageView alloc]initWithImage:imageBeer];
        ImageViewBeer.frame = CGRectMake(self.frame.size.width * 2, -152, imageBeer.size.width, imageBeer.size.height);
        [self.scrollView addSubview:ImageViewBeer];
        
        UIImage *imageHert = [UIImage imageNamed:@"Home_hert"];
        UIImageView *ImageViewHert = [[UIImageView alloc]initWithImage:imageHert];
        ImageViewHert.frame = CGRectMake(self.frame.size.width * 3, -152, imageHert.size.width, imageHert.size.height);
        [self.scrollView addSubview:ImageViewHert];
        
    }
    
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * 4., 0);
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
