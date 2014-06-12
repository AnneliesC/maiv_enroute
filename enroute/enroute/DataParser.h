//
//  DataParser.h
//  enroute
//
//  Created by Annelies Clauwaert on 10/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppModel.h"
#import "DataObjectFactory.h"

#import "Group.h"
#import "Challenge.h"
#import "AppModel.h"
#import "RushChallenge.h"
#import "Location.h"
#import "Helpers.h"

#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"


@interface DataParser : NSObject

@property (nonatomic) bool challengesLoaded;
@property (nonatomic) bool rushChallengesLoaded;
@property (nonatomic) bool locationsLoaded;
@property (nonatomic) bool resultsLoaded;

- (void)loadGroupsData;
- (void)loadChallengesData;
- (void)loadAppData;

@end
