//
//  AppModel.m
//  enroute
//
//  Created by Annelies Clauwaert on 8/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel
@synthesize groups = _groups;
@synthesize appUser = _appUser;
@synthesize challenges = _challenges;
@synthesize locations = _locations;
@synthesize rushChallenges = _rushChallenges;
@synthesize isGroupToday = _isGroupToday;

+ (id)sharedModel {
    static AppModel *sharedAppModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAppModel = [[self alloc] init];
    });
    return sharedAppModel;
}

- (id)init
{
    self = [super init];
    if (self) {
        groups = [[NSArray alloc] init];
        challenges = [[NSArray alloc] init];
        locations = [[NSArray alloc] init];
        rushChallenges = [[NSArray alloc] init];
    }
    return self;
}

- (void)setGroups:(NSArray *)groupsData
{
    groups = groupsData;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GROUPS_LOADED" object:self];
}

- (NSArray *)groups {
    return groups;
}

- (void)setAppUser:(NSDictionary *)appUserData
{
    appUser = appUserData;
    
    NSDate* currentDate = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd "];
    NSString *date = [appUser objectForKey:@"date"];
    NSDate *userDate = [formatter dateFromString:date];
    NSComparisonResult comparisonResult = [currentDate compare:userDate];
    
    if(comparisonResult){
        _isGroupToday = true;
    }else{
        _isGroupToday = false;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"USER_LOADED" object:self];
}

- (NSDictionary *)appUser {
    return appUser;
}

- (void)setChallenges:(NSArray *)challengesData
{
    challenges = challengesData;
    // [[NSNotificationCenter defaultCenter] postNotificationName:@"CHALLENGES_LOADED" object:self];
}

- (NSArray *)challenges {
    return challenges;
}

- (void)setLocations:(NSArray *)locationsData
{
    locations = locationsData;
    // [[NSNotificationCenter defaultCenter] postNotificationName:@"LOCATIONS_LOADED" object:self];
}

- (NSArray *)locations {
    return locations;
}

- (void)setRushChallenges:(NSArray *)rushChallengesData
{
    rushChallenges = rushChallengesData;
    // [[NSNotificationCenter defaultCenter] postNotificationName:@"RUSH_CHALLENGES_LOADED" object:self];
}

- (NSArray *)rushChallenges {
    return rushChallenges;
}

@end
