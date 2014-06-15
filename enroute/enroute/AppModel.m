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
@synthesize isMentor = _isMentor;
@synthesize groupId = _groupId;
@synthesize results = _results;
@synthesize resultsToBeUploaded = _resultsToBeUploaded;
@synthesize rushChallenge = _rushChallenge;
@synthesize rushChallengePushed = _rushChallengePushed;

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
    
    if([[appUser objectForKey:@"role"]  isEqual: @"admin"] || [[appUser objectForKey:@"role"]  isEqual: @"mentor"]){
        
        NSLog(@"[AppModel] logged in as mentor or admin");
        
        _isMentor = true;
        _isGroupToday = true;
        
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        for (Group *group in groups)
        {
            NSDate *groupDate = [formatter dateFromString:[NSString stringWithFormat:@"%@",group.date]];
            NSComparisonResult comparisonResult = [currentDate compare:groupDate];
            
            if(comparisonResult == YES){
                NSLog(@"[AppModel] en route group today: %li",(long)group.identifier);
                groupId = [NSString stringWithFormat:@"%li",(long)group.identifier];
            }
        }
        
    }else{
        
        NSLog(@"[AppModel] logged in as participant");
        
        _isMentor = false;
        _groupId = [appUser objectForKey:@"group_id"];
        NSLog(@"group id user : %@", [appUser objectForKey:@"group_id"]);
        NSLog(@"group id user : %@", groupId);
        
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        NSString *date = [appUser objectForKey:@"date"];
        NSDate *userDate = [formatter dateFromString:date];
        NSComparisonResult comparisonResult = [currentDate compare:userDate];
        
        NSLog(@"APP user: %@",userDate);
        NSLog(@"APP current: %@",currentDate);
        
        _isGroupToday = false;
        if(comparisonResult == YES){
            _isGroupToday = true;
            NSLog(@"[AppModel] user has en route day today");
        }
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

- (void)setResults:(NSArray *)resultsData
{
    results = resultsData;
    // [[NSNotificationCenter defaultCenter] postNotificationName:@"RUSH_CHALLENGES_LOADED" object:self];
}

- (NSArray *)results {
    return results;
}

- (void)setRushChallenge:(RushChallenge *)rushChallengeData
{
    rushChallenge = rushChallengeData;
    if(isMentor == NO){
        NSLog(@"APPMODEL RECEIVED CHALLLENGE");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RUSH_CHALLENGE_LOADED" object:self];
    }
}

- (RushChallenge *)rushChallenge {
    return rushChallenge;
}

- (void)setRushChallengePushed:(bool)rushChallengePushedData
{
    rushChallengePushed = rushChallengePushedData;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SHOW_RUSH" object:self];
}

- (bool)rushChallengePushed {
    return rushChallengePushed;
}

- (NSString *)groupId {
    return groupId;
}

@end
