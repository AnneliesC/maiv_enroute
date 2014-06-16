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
        
        UIImage *backgroundImage = [UIImage imageNamed:@"uploadBackground"];
        UIImageView *background = [[UIImageView alloc]initWithImage:backgroundImage];
        background.frame=CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height);
        [self addSubview:background];
        
        self.uploadedResultsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.uploadedResultsLabel.font = [UIFont fontWithName:@"SportsWorld" size:58];
        self.uploadedResultsLabel.textColor = [UIColor colorWithRed:70/255.0f green:94/255.0f blue:106/255.0f alpha:1];
        self.uploadedResultsLabel.text = @"0";
        [self.uploadedResultsLabel sizeToFit];
        self.uploadedResultsLabel.center = CGPointMake(self.frame.size.width/2, 750/2);
        [self addSubview:self.uploadedResultsLabel];

        
//        self.scrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 250,self.frame.size.width, 319)];
//        [self addSubview:self.scrollView];
//        
//        UIImage *BirdOnStickImage = [UIImage imageNamed:@"User_bird"];
//        self.birdOnStick = [[UIImageView alloc]initWithImage:BirdOnStickImage];
//        self.birdOnStick.frame=CGRectMake(0, 210, BirdOnStickImage.size.width, BirdOnStickImage.size.height);
//        [self addSubview:self.birdOnStick];
//        
//        int xPos = 0;
//        int yPos = -160;
//        
//        for (int j = 0; j < 10; j++) {
//            
//            for (int i = 0; i < 3; i++) {
//                
//                NSLog(@"ik haat u");
//                
//                UIImage *placeholderImage = [UIImage imageNamed:@"User_resultButton"];
//                self.placeholder = [[UIImageView alloc]initWithImage:placeholderImage];
//                self.placeholder.frame=CGRectMake(xPos, yPos, placeholderImage.size.width, placeholderImage.size.height);
//                [self.scrollView addSubview:self.placeholder];
//                
//                xPos+=placeholderImage.size.width;
//            }
//        
//            xPos=0;
//            yPos+=self.placeholder.frame.size.height;
//        }
//        
//        self.scrollView.contentSize = CGSizeMake(0, yPos);
//        [self.scrollView setShowsVerticalScrollIndicator:NO];
        
        
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
