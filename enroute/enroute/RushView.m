//
//  RushView.m
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "RushView.h"

@implementation RushView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        if([[AppModel sharedModel] rushChallenge] != nil){
            [self createRush];
        }else{
            [self createBackgroundEmptyRush];
        }
        
    }
    return self;
}

-(void)createBackgroundEmptyRush{
    
    UIImage *emptyRushImage = [UIImage imageNamed:@"Rush_emptyBackgrond"];
    UIImageView *emptyRush = [[UIImageView alloc]initWithImage:emptyRushImage];
    emptyRush.frame=CGRectMake(0,0,emptyRushImage.size.width, emptyRushImage.size.height);
    [self addSubview:emptyRush];
    
}

-(void)createRush{
    NSLog(@"CREATE BUTTONS");
    //terug
    UIImage *btnBackImage = [UIImage imageNamed:@"Button_back"];
    self.btnBack= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnBack.frame=CGRectMake(0, 502, btnBackImage.size.width, btnBackImage.size.height);
    [self.btnBack setBackgroundImage:btnBackImage forState:UIControlStateNormal];
    [self.btnBack setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnBack];
    
    //rush
    UIImage *btnStartImage = [UIImage imageNamed:@"Button_start"];
    self.btnStart= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnStart.frame=CGRectMake(160, 502, btnStartImage.size.width, btnStartImage.size.height);
    [self.btnStart setBackgroundImage:btnStartImage forState:UIControlStateNormal];
    [self.btnStart setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.btnStart];
    
    UIImage *woodenBeamImage = [UIImage imageNamed:@"woodenBeam"];
    self.woodenBeam = [[UIImageView alloc]initWithImage:woodenBeamImage];
    self.woodenBeam.frame=CGRectMake(0,493, woodenBeamImage.size.width, woodenBeamImage.size.height);
    [self addSubview:self.woodenBeam];
    
}

-(void)updateView{
    
    RushChallenge *rushChallenge = [[AppModel sharedModel] rushChallenge];
    
    UIScrollView *scrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, self.frame.size.height)];
    [scrollView setShowsVerticalScrollIndicator:NO];
    scrollView.pagingEnabled = NO;
    [self addSubview:scrollView];
    
    // separator
    UIImage *seperatorImage = [UIImage imageNamed:@"seperator"];
    UIImageView *seperator = [[UIImageView alloc]initWithImage:seperatorImage];
    seperator.frame=CGRectMake(35,82,seperatorImage.size.width, seperatorImage.size.height);
    [scrollView addSubview:seperator];
    
    // timer
    
    self.timerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.timerLabel.font = [UIFont fontWithName:@"SportsWorld" size:38];
    self.timerLabel.textColor = [UIColor colorWithRed:70/255.0f green:94/255.0f blue:106/255.0f alpha:1];
    self.timerLabel.text = @"00:00:00";
    [self.timerLabel sizeToFit];
    self.timerLabel.center = CGPointMake(self.frame.size.width/2, seperator.frame.origin.y + seperator.frame.size.height + 45);
    [scrollView addSubview:self.timerLabel];
    
    // seperator
    
    UIImageView *seperator2 = [[UIImageView alloc]initWithImage:seperatorImage];
    seperator2.frame = CGRectMake(35,self.timerLabel.frame.origin.y + self.timerLabel.frame.size.height + 25,
                                seperatorImage.size.width, seperatorImage.size.height);
    [scrollView addSubview:seperator2];
    
    // title
    
    NSString *titleText = [NSString stringWithFormat:@"%@", rushChallenge.title];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(35, seperator2.frame.origin.y + seperator2.frame.size.height + 40, 0, 0)];
    title.font = [UIFont fontWithName:@"SportsWorld" size:17];
    title.textColor = [UIColor colorWithRed:70/255.0f green:94/255.0f blue:106/255.0f alpha:1];
    title.text = titleText;
    [title sizeToFit];
    [scrollView addSubview:title];
    
    // text
    NSString *descriptionText = [NSString stringWithFormat:@"%@", rushChallenge.info];
    UITextView *description = [[UITextView alloc] initWithFrame:CGRectZero];
    description.textColor = [UIColor colorWithRed:46/255.0f green:55/255.0f blue:61/255.0f alpha:1];
    description.frame = CGRectMake(35,title.frame.origin.y + title.frame.size.height + 25,self.frame.size.width-70,0);
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
    [self sendSubviewToBack:scrollView];

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
