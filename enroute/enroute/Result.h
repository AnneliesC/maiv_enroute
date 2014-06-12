//
//  Result.h
//  enroute
//
//  Created by Annelies Clauwaert on 12/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface Result : NSObject

@property (nonatomic) NSInteger identifier;
@property (nonatomic,strong) NSString *fileType;
@property (nonatomic) NSInteger challengeId;
@property (nonatomic) NSInteger userGroupId;
@property (nonatomic) NSInteger userId;
@property (nonatomic,strong) NSDate *datetime;

@end
