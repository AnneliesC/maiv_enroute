//
//  IntroView.h
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"


@interface IntroView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic,strong) UIButton *btnFinishIntro;

@end
