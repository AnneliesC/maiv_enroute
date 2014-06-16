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
#import "Result.h"

#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@interface DataParser : NSObject

@property (nonatomic) bool challengesLoaded;
@property (nonatomic) bool rushChallengesLoaded;
@property (nonatomic) bool locationsLoaded;
@property (nonatomic) bool groupRushLoaded;

- (void)loadGroupsData;
- (void)loadChallengesData;
- (void)loadAppData;
- (void)loadLocationsData;
- (void)uploadRushChallengeWithGroupId:(int)groupId challengeId:(int)challengeId andDuration:(int)duration;
- (void)uploadAudio:(Result *)result forFile:(NSData *)audioData;
- (void)uploadPhoto:(Result *)result forFile:(NSData *)imageData;
- (void)uploadVideo:(Result *)result forFile:(NSData *)videoData;

@end
