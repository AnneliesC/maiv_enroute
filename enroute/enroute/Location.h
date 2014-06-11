//
//  Location.h
//  enroute
//
//  Created by Annelies Clauwaert on 10/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (nonatomic) NSInteger userId;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) bool lost;

@end
