//
//  DataObjectFactory.h
//  enroute
//
//  Created by Annelies Clauwaert on 8/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"
#import "Challenge.h"
#import "Location.h"
#import "RushChallenge.h"
#import "Result.h"

@interface DataObjectFactory : NSObject

+ (Group *)createGroupFromDictionary:(NSDictionary*)dictionary;
+ (Challenge *)createChallengeFromDictionary:(NSDictionary*)dictionary;
+ (Location *)createLocationFromDictionary:(NSDictionary*)dictionary;
+ (RushChallenge *)createRushChallengeFromDictionary:(NSDictionary*)dictionary;
+ (Result *)createResultChallengeFromDictionary:(NSDictionary*)dictionary;

@end
