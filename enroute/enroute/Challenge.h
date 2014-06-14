//
//  Challenge.h
//  enroute
//
//  Created by Annelies Clauwaert on 10/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Challenge : NSObject

@property (nonatomic) NSInteger identifier;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *info;
@property (nonatomic,strong) NSString *theme;
@property (nonatomic,strong) NSString *challenge_type;

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

@end
