//
//  IntroView.m
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "IntroView.h"

@implementation IntroView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.scrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(37, 137,250, 297)];
        [self addSubview:self.scrollView];
        
        self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectZero];
        self.pageControl.numberOfPages = 4;
        self.pageControl.frame = CGRectMake(0, 0, self.pageControl.frame.size.width, self.pageControl.frame.size.height);
        self.pageControl.center = CGPointMake(self.frame.size.width/2, self.scrollView.frame.size.height + self.scrollView.frame.origin.y - self.pageControl.frame.size.height - 30);
        self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
        self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        [self addSubview:self.pageControl];

        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Intro_backgroundUser"]];
        
        UIImage *imageIntro1 = [UIImage imageNamed:@"Intro_pagina1"];
        UIImageView *ImageIntro1 = [[UIImageView alloc]initWithImage:imageIntro1];
        ImageIntro1.frame = CGRectMake(ImageIntro1.frame.size.width * 0, 0, imageIntro1.size.width, imageIntro1.size.height);
        [self.scrollView addSubview:ImageIntro1];
        
        
        UIImage *imageIntro2 = [UIImage imageNamed:@"Intro_pagina2"];
        UIImageView *ImageIntro2 = [[UIImageView alloc]initWithImage:imageIntro2];
        ImageIntro2.frame = CGRectMake(ImageIntro2.frame.size.width * 1, 0, imageIntro2.size.width, imageIntro2.size.height);
        [self.scrollView addSubview:ImageIntro2];
        
        
        UIImage *imageIntro3 = [UIImage imageNamed:@"Intro_pagina3"];
        UIImageView *ImageIntro3 = [[UIImageView alloc]initWithImage:imageIntro3];
        ImageIntro3.frame = CGRectMake(ImageIntro3.frame.size.width * 2, 0, imageIntro3.size.width, imageIntro3.size.height);
        [self.scrollView addSubview:ImageIntro3];
        
        UIImage *imageIntro4 = [UIImage imageNamed:@"Intro_pagina4"];
        UIImageView *ImageIntro4 = [[UIImageView alloc]initWithImage:imageIntro4];
        ImageIntro4.frame = CGRectMake(ImageIntro4.frame.size.width * 3, 0, imageIntro4.size.width, imageIntro4.size.height);
        [self.scrollView addSubview:ImageIntro4];
        
        UIImage *btnFinishIntroImage = [UIImage imageNamed:@"Intro_pagina4_button"];
        self.btnFinishIntro= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnFinishIntro.frame=CGRectMake(ImageIntro4.frame.size.width * 3+35, 120, btnFinishIntroImage.size.width, btnFinishIntroImage.size.height);
        [self.btnFinishIntro setBackgroundImage:btnFinishIntroImage forState:UIControlStateNormal];
        [self.btnFinishIntro setTitle:@"" forState:UIControlStateNormal];
        [self.scrollView addSubview:self.btnFinishIntro];
        
        
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 4, 0);
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
