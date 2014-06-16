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
@property (nonatomic) int userGroupId;
@property (nonatomic) int userIdentifier;
@property (nonatomic) int challengeId;

@end
