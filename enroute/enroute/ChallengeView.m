//
//  ChallengeView.m
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "ChallengeView.h"

@interface ChallengeView()

@end

@implementation ChallengeView

- (id)initWithFrame:(CGRect)frame andChallenge:(Challenge*)challenge
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // back
        UIImage *btnBackImage = [UIImage imageNamed:@"Button_back"];
        self.btnBack= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnBack.frame=CGRectMake(0, 502, btnBackImage.size.width, btnBackImage.size.height);
        [self.btnBack setBackgroundImage:btnBackImage forState:UIControlStateNormal];
        [self.btnBack setTitle:@"" forState:UIControlStateNormal];
        
        // rush
        UIImage *btnStartImage = [UIImage imageNamed:@"Button_start"];
        self.btnStart= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnStart.frame=CGRectMake(160, 502, btnStartImage.size.width, btnStartImage.size.height);
        [self.btnStart setBackgroundImage:btnStartImage forState:UIControlStateNormal];
        [self.btnStart setTitle:@"" forState:UIControlStateNormal];
        
        UIImage *woodenBeamImage = [UIImage imageNamed:@"woodenBeam"];
        UIImageView *woodenBeam = [[UIImageView alloc]initWithImage:woodenBeamImage];
        woodenBeam.frame=CGRectMake(0,493, woodenBeamImage.size.width, woodenBeamImage.size.height);
        
        UIScrollView *scrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, self.frame.size.height)];
        [scrollView setShowsVerticalScrollIndicator:NO];
        scrollView.pagingEnabled = NO;
        [self addSubview:scrollView];
        
        // title
        NSString *titleText = [NSString stringWithFormat:@"%@", challenge.title];
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
        
        // icon
        NSString *iconImageName = @"";
        NSString *iconInfoText = @"";
        
        if([challenge.theme  isEqual: @"de uil"]){
            iconImageName = @"owl";
            iconInfoText = @"Deze opdracht heeft de uil als thema. Als je even goed nadenkt lukt het wel!";
        }else if([challenge.theme  isEqual: @"de muis"]){
            iconImageName = @"mouse";
            iconInfoText = @"Deze opdracht heeft de uil als thema. Als je even goed nadenkt lukt het wel!";
        }else if([challenge.theme  isEqual: @"het hert"]){
            iconImageName = @"doe";
            iconInfoText = @"Deze opdracht heeft de uil als thema. Als je even goed nadenkt lukt het wel!";
        }else if([challenge.theme  isEqual: @"de beer"]){
            iconImageName = @"bear";
            iconInfoText = @"Deze opdracht heeft de uil als thema. Als je even goed nadenkt lukt het wel!";
        }
        
        UIImage *iconImage = [UIImage imageNamed:iconImageName];
        UIImageView *icon = [[UIImageView alloc]initWithImage:iconImage];
        icon.frame=CGRectMake(35,title.frame.origin.y + title.frame.size.height + 55/2 + 10, iconImage.size.width, iconImage.size.height);
        [scrollView addSubview:icon];
        
        // icon info
        
        UITextView *iconInfo = [[UITextView alloc] initWithFrame:CGRectZero];
        iconInfo.textColor = [UIColor colorWithRed:46/255.0f green:55/255.0f blue:61/255.0f alpha:1];
        iconInfo.frame = CGRectMake(35 + icon.frame.size.width + 54/2,title.frame.origin.y + title.frame.size.height + 55/2,
                                    self.frame.size.width - 70 - 54/2 - icon.frame.size.width,0);
        iconInfo.backgroundColor = [UIColor clearColor];
        iconInfo.text = iconInfoText;
        iconInfo.scrollEnabled = FALSE;
        iconInfo.editable = FALSE;
        
        NSMutableParagraphStyle *iconInfoTextStyle = [[NSMutableParagraphStyle alloc] init];
        [iconInfoTextStyle setLineSpacing:12];
        NSMutableAttributedString  *iconInfoTextAttributes = [[NSMutableAttributedString alloc]
                                                                 initWithString:iconInfoText attributes: @{NSFontAttributeName: [UIFont fontWithName:@"Droid Serif" size:12.5]}];
        [iconInfoTextAttributes addAttribute:NSParagraphStyleAttributeName value:iconInfoTextStyle range:NSMakeRange(0, iconInfoText.length)];
        iconInfo.attributedText = iconInfoTextAttributes;
        
        [iconInfo sizeToFit];
        [scrollView addSubview:iconInfo];
        
        // separator
        UIImage *seperatorImage = [UIImage imageNamed:@"seperator"];
        UIImageView *seperator = [[UIImageView alloc]initWithImage:seperatorImage];
        seperator.frame=CGRectMake(35,iconInfo.frame.origin.y + iconInfo.frame.size.height + 55/2,
                                   seperatorImage.size.width, seperatorImage.size.height);
        [scrollView addSubview:seperator];
        
        // text
        NSString *descriptionText = [NSString stringWithFormat:@"%@", challenge.info];
        UITextView *description = [[UITextView alloc] initWithFrame:CGRectZero];
        description.textColor = [UIColor colorWithRed:46/255.0f green:55/255.0f blue:61/255.0f alpha:1];
        description.frame = CGRectMake(35,seperator.frame.origin.y + seperator.frame.size.height + 55/2,self.frame.size.width-70,0);
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
        [self addSubview:self.btnStart];
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
