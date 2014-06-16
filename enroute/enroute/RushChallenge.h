//
//  RushChallenge.h
//  enroute
//
//  Created by Annelies Clauwaert on 10/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RushChallenge : NSObject

@property (nonatomic) NSInteger identifier;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *info;
@property (nonatomic,strong) NSString *challengeType;
@property (nonatomic) NSInteger duration;
@property (nonatomic,strong) NSString *timePushed;

@end
