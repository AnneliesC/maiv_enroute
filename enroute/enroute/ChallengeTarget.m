//
//  ChallengeTarget.m
//  enroute
//
//  Created by Annelies Clauwaert on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "ChallengeTarget.h"

@implementation ChallengeTarget

- (id)initWithFrame:(CGRect)frame andTheme:(NSString*)theme
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIColor *red = [UIColor colorWithRed:252/255.0f green:105/255.0f blue:97/255.0f alpha:1];
        UIColor *gray = [UIColor colorWithRed:153/255.0f green:169/255.0f blue:178/255.0f alpha:1];
        UIColor *blue = [UIColor colorWithRed:59/255.0f green:80/255.0f blue:92/255.0f alpha:1];
        UIColor *green = [UIColor colorWithRed:174/255.0f green:206/255.0f blue:193/255.0f alpha:1];
        UIColor *white = [UIColor whiteColor];
        
        UIColor *targetBorderColor = blue;
        UIColor *targetInnerBorderColor = white;
        UIColor *targetFillColor;
        
        NSString *challengeTargetIconImageName = @"";
        
        if([theme  isEqual: @"de uil"]){
            targetFillColor = red;
            challengeTargetIconImageName = @"challengeTargetOwl";
        }else if([theme  isEqual: @"de muis"]){
            targetFillColor = gray;
            challengeTargetIconImageName = @"challengeTargetMouse";
        }else if([theme  isEqual: @"het hert"]){
            targetFillColor = green;
            challengeTargetIconImageName = @"challengeTargetDoe";
        }else if([theme  isEqual: @"de beer"]){
            targetFillColor = blue;
            challengeTargetIconImageName = @"challengeTargetBear";
        }
        
        double targetBorderRadius = self.frame.size.width;
        CAShapeLayer *targetBorder = [CAShapeLayer layer];
        targetBorder.fillColor = targetBorderColor.CGColor;
        targetBorder.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, targetBorderRadius, targetBorderRadius)].CGPath;
        [self.layer addSublayer:targetBorder];
        
        double targetInnerBorderRadius = (self.frame.size.width/100)*90;
        CAShapeLayer *targetInnerBorder = [CAShapeLayer layer];
        targetInnerBorder.fillColor = targetInnerBorderColor.CGColor;
        targetInnerBorder.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake((self.frame.size.width/100)*((100-90)/2), (self.frame.size.width/100)*((100-90)/2), targetInnerBorderRadius, targetInnerBorderRadius)].CGPath;
        [targetBorder addSublayer:targetInnerBorder];
        
        double targetRadius = (self.frame.size.width/100)*80;
        CAShapeLayer *target = [CAShapeLayer layer];
        target.fillColor = targetFillColor.CGColor;
        target.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake((self.frame.size.width/100)*((100-80)/2), (self.frame.size.width/100)*((100-80)/2), targetRadius,targetRadius)].CGPath;
        [targetInnerBorder addSublayer:target];
        
        if(self.frame.size.width > 48){
            UIImage *challengeTargetIconImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",challengeTargetIconImageName]];
            UIImageView *challengeTargetIcon = [[UIImageView alloc] initWithImage:challengeTargetIconImage];
            challengeTargetIcon.frame = CGRectMake(0,0,(self.frame.size.width/100)*60,(self.frame.size.height/100)*60);
            challengeTargetIcon.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2+1);
            [self addSubview:challengeTargetIcon];
        }
        
        CAShapeLayer *textureMask = [CAShapeLayer layer];
        textureMask.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, targetBorderRadius, targetBorderRadius)].CGPath;
        
        UIImage *textureImage = [UIImage imageNamed:[NSString stringWithFormat:@"texture"]];
        UIImageView *texture = [[UIImageView alloc] initWithImage:textureImage];
        texture.frame = CGRectMake(0,0,textureImage.size.width,textureImage.size.height);
        texture.layer.mask = textureMask;
        [self addSubview:texture];
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
