//
//  Result.h
//  enroute
//
//  Created by Annelies Clauwaert on 16/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject<NSCoding>

@property (nonatomic,strong) NSString *fileType;
@property (nonatomic,strong) NSDate *datetime;
@property (nonatomic) NSInteger *groupId;
@property (nonatomic) NSInteger *userId;
@property (nonatomic) NSInteger *challengeId;

@end
