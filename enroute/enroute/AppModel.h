//
//  AppModel.h
//  enroute
//
//  Created by Annelies Clauwaert on 8/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"
#import "Helpers.h"
#import "RushChallenge.h"

@interface AppModel: NSObject{
    
    NSArray *groups;
    NSDictionary *appUser;
    NSArray *challenges;
    NSArray *locations;
    NSArray *rushChallenges;
    NSArray *results;
    NSMutableArray *resultsToBeUploaded;
    bool isGroupToday;
    bool isMentor;
    bool rushChallengePushed;
    NSString *groupId;
    RushChallenge *rushChallenge;
}

@property (nonatomic,strong) RushChallenge *rushChallenge;
@property (nonatomic,strong) NSArray *groups;
@property (nonatomic,strong) NSDictionary *appUser;
@property (nonatomic,strong) NSArray *challenges;
@property (nonatomic,strong) NSArray *locations;
@property (nonatomic,strong) NSArray *rushChallenges;
@property (nonatomic,strong) NSArray *results;
@property (nonatomic,strong) NSMutableArray *resultsToBeUploaded;
@property (nonatomic) bool isGroupToday;
@property (nonatomic) bool isMentor;
@property (nonatomic) bool rushChallengePushed;
@property (nonatomic) NSString *groupId;

+ (id)sharedModel;
- (void)setGroups:(NSArray *)groupsData;
- (void)setAppUser:(NSDictionary *)appUserData;
- (void)setChallenges:(NSArray *)challengesData;
- (void)setLocations:(NSArray *)locationsData;
- (void)setRushChallenges:(NSArray *)rushChallengesData;

@end
