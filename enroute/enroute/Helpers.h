//
//  Helpers.h
//  enroute
//
//  Created by Annelies Clauwaert on 11/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helpers : NSObject

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSString *)getCurrentDateAsString;
+ (NSString *)getCurrentDateAsStringRaw;
+ (NSDate *)getCurrentDate;
+ (NSDate *)getCurrentTime;
+ (NSString *)getCurrentTimeAsString;

@end
