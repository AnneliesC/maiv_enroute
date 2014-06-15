//
//  RushChallengesDetailView.m
//  enroute
//
//  Created by Gilles Van de Ven on 13/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "RushChallengesDetailView.h"

@interface RushChallengesDetailView()


@end

@implementation RushChallengesDetailView

- (id)initWithFrame:(CGRect)frame andRushChallenge:(RushChallenge*)rushChallenge
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
        
        //rush
        UIImage *btnRushImage = [UIImage imageNamed:@"Button_rush"];
        self.btnRush= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnRush.frame=CGRectMake(160, 502, btnRushImage.size.width, btnRushImage.size.height);
        [self.btnRush setBackgroundImage:btnRushImage forState:UIControlStateNormal];
        [self.btnRush setTitle:@"" forState:UIControlStateNormal];
        
        UIImage *woodenBeamImage = [UIImage imageNamed:@"woodenBeam"];
        UIImageView *woodenBeam = [[UIImageView alloc]initWithImage:woodenBeamImage];
        woodenBeam.frame=CGRectMake(0,493, woodenBeamImage.size.width, woodenBeamImage.size.height);
        
        UIScrollView *scrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, self.frame.size.height)];
        [scrollView setShowsVerticalScrollIndicator:NO];
        scrollView.pagingEnabled = NO;
        [self addSubview:scrollView];
        
        // title
        NSString *titleText = [NSString stringWithFormat:@"%@", rushChallenge.title];
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
        title.font = [UIFont fontWithName:@"SportsWorld" size:17];
        title.textColor = [UIColor colorWithRed:70/255.0f green:94/255.0f blue:106/255.0f alpha:1];
        title.text = titleText;
        [title sizeToFit];
        title.center = CGPointMake(self.frame.size.width/2, 82);
        [scrollView addSubview:title];
        
        // title left @ right
        UIImage *titleLeftImage = [UIImage imageNamed:@"titleLeft"];
        UIImageView *titleLeft = [[UIImageView alloc]initWithImage:titleLeftImage];
        titleLeft.frame=CGRectMake(title.frame.origin.x - titleLeftImage.size.width - 8,
                                   title.frame.origin.y + 3,
                                   titleLeftImage.size.width,
                                   titleLeftImage.size.height);
        [scrollView addSubview:titleLeft];
        
        UIImage *titleRightImage = [UIImage imageNamed:@"titleRight"];
        UIImageView *titleRight = [[UIImageView alloc]initWithImage:titleRightImage];
        titleRight.frame=CGRectMake((self.frame.size.width/2)-titleLeft.frame.size.width + ((self.frame.size.width/2)-titleLeft.frame.origin.x)-2,
                                    title.frame.origin.y + 3,
                                    titleRightImage.size.width,
                                    titleRightImage.size.height);
        [scrollView addSubview:titleRight];
        
        // separator
        UIImage *seperatorImage = [UIImage imageNamed:@"seperator"];
        UIImageView *seperator = [[UIImageView alloc]initWithImage:seperatorImage];
        seperator.frame=CGRectMake(35,title.frame.origin.y + title.frame.size.height + 55/2,
                                   seperatorImage.size.width, seperatorImage.size.height);
        [scrollView addSubview:seperator];
        
        // slider
        self.slider = [[UISlider alloc] initWithFrame:CGRectMake(35,seperator.frame.origin.y + seperator.frame.size.height + 115/2,
                                                                 self.frame.size.width-70,30)];
        self.slider.minimumValue = 5;
        self.slider.maximumValue = 20;
        self.slider.continuous = YES;
        
        UIImage *sliderThumb = [UIImage imageNamed:@"slider"];
        [self.slider setThumbImage:sliderThumb forState:UIControlStateNormal];
        [self.slider setThumbImage:sliderThumb forState:UIControlStateHighlighted];
        
        [self.slider setMaximumTrackImage:[UIImage imageNamed:@"sliderMaximum"] forState:UIControlStateNormal];
        [self.slider setMinimumTrackImage:[UIImage imageNamed:@"sliderMinimum"] forState:UIControlStateNormal];
        
        [scrollView addSubview:self.slider];
        
        // duration
        NSString *durationText = @"5";
        self.duration = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 22, 15)];
        self.duration.font = [UIFont fontWithName:@"SportsWorld" size:16];
        self.duration.textColor = [UIColor colorWithRed:252/255.0f green:105/255.0f blue:97/255.0f alpha:1];
        self.duration.text = durationText;
        self.duration.center = CGPointMake(53, 295/2);
        [scrollView addSubview:self.duration];
        
        // separator 2
        UIImageView *seperator2 = [[UIImageView alloc]initWithImage:seperatorImage];
        seperator2.frame=CGRectMake(35,self.slider.frame.origin.y + self.slider.frame.size.height + 50/2,
                                   seperatorImage.size.width, seperatorImage.size.height);
        [scrollView addSubview:seperator2];
        
        // text
        NSString *descriptionText = [NSString stringWithFormat:@"%@", rushChallenge.info];
        UITextView *description = [[UITextView alloc] initWithFrame:CGRectZero];
        description.textColor = [UIColor colorWithRed:46/255.0f green:55/255.0f blue:61/255.0f alpha:1];
        description.frame = CGRectMake(35,seperator2.frame.origin.y + seperator2.frame.size.height + 55/2,self.frame.size.width-70,0);
        description.backgroundColor = [UIColor clearColor];
        description.text = descriptionText;
        description.scrollEnabled = FALSE;
        description.editable = FALSE;
        
        NSMutableParagraphStyle *descriptionTextStyle = [[NSMutableParagraphStyle alloc] init];
        [descriptionTextStyle setLineSpacing:12];
        NSMutableAttributedString  *descriptionTextAttributes = [[NSMutableAttributedString alloc]
                                                                 initWithString:descriptionText attributes: @{NSFontAttributeName: [UIFont fontWithName:@"Droid Serif" size:12.5]}];
        [descriptionTextAttributes addAttribute:NSParagraphStyleAttributeName value:descriptionTextStyle range:NSMakeRange(0, descriptionText.length)];
        description.attributedText = descriptionTextAttributes;
        
        [description sizeToFit];
        [scrollView addSubview:description];
        
        scrollView.contentSize = CGSizeMake(self.frame.size.width,
                                            description.frame.origin.y +
                                            description.frame.size.height +
                                            120);
        
        [self addSubview:self.btnBack];
        [self addSubview:self.btnRush];
        [self addSubview:woodenBeam];
        
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
