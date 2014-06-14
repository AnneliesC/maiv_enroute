//
//  CompassView.m
//  enroute
//
//  Created by Gilles Van de Ven on 11/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "CompassView.h"

@implementation CompassView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
   
        self.mapView = [[MapView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.mapView];
        
        self.challengeTargetsContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.challengeTargetsContainer];
        
        self.btnChallenge = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnChallenge.enabled = FALSE;
        self.btnChallenge.hidden = TRUE;
        [self addSubview:self.btnChallenge];
        
        self.btnCloseButton =[UIButton buttonWithType:UIButtonTypeCustom];
        
        UIImage *btnCloseChallengeImage = [UIImage imageNamed:@"closeChallengeButton"];
        [self.btnCloseButton setFrame:CGRectMake(0, 0, btnCloseChallengeImage.size.width, btnCloseChallengeImage.size.height)];
        self.btnCloseButton.center = CGPointMake((self.frame.size.width - btnCloseChallengeImage.size.width) - 40,130);
        [self.btnCloseButton setBackgroundImage:btnCloseChallengeImage forState:UIControlStateNormal];
        self.btnCloseButton.hidden = TRUE;
        self.btnCloseButton.enabled = FALSE;
        [self addSubview:self.btnCloseButton];
    }
    return self;
}

-(void)showChallengeButtonForChallenge:(Challenge*)challenge{
    NSLog(@"[MapBoxView] Create button");
    
    NSString *btnChallengeImageName = @"";
    
    if([challenge.theme  isEqual: @"owl"]){
        btnChallengeImageName = @"challengeButtonOwl";
    }else if([challenge.theme  isEqual: @"mouse"]){
        btnChallengeImageName = @"challengeButtonMouse";
    }else if([challenge.theme  isEqual: @"doe"]){
        btnChallengeImageName = @"challengeButtonOwl";
    }else if([challenge.theme  isEqual: @"squirrel"]){
        btnChallengeImageName = @"challengeButtonMouse";
    }
    self.btnCloseButton.hidden = FALSE;
    self.btnCloseButton.enabled = TRUE;
    
    self.btnChallenge.enabled = TRUE;
    self.btnChallenge.hidden = FALSE;
    
    UIImage *btnChallengeImage = [UIImage imageNamed:btnChallengeImageName];
    [self.btnChallenge setFrame:CGRectMake(0, 0, btnChallengeImage.size.width+2, btnChallengeImage.size.height+2)];
    self.btnChallenge.center = CGPointMake((self.frame.size.width/2),(self.frame.size.height/2));
    [self.btnChallenge setBackgroundImage:btnChallengeImage forState:UIControlStateNormal];
    
}

-(void)hideChallengeButton{
    NSLog(@"[MapBoxView] Hide button");
    
    self.btnCloseButton.hidden = TRUE;
    self.btnCloseButton.enabled = FALSE;
    
    self.btnChallenge.enabled = FALSE;
    self.btnChallenge.hidden = TRUE;
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
