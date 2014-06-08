//
//  Group.h
//  enroute
//
//  Created by Annelies Clauwaert on 8/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic) NSInteger identifier;
@property (nonatomic) NSInteger participants;
@property (nonatomic) NSInteger groupLimit;
@property (nonatomic,strong) NSDate *date;

@end
