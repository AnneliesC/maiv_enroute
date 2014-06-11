//
//  AppModel.h
//  enroute
//
//  Created by Annelies Clauwaert on 8/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel: NSObject{
    
    NSArray *groups;
    NSDictionary *appUser;
    NSArray *challenges;
    NSArray *locations;
    NSArray *rushChallenges;
    bool isGroupToday;
}

@property (nonatomic,strong) NSArray *groups;
@property (nonatomic,strong) NSDictionary *appUser;
@property (nonatomic,strong) NSArray *challenges;
@property (nonatomic,strong) NSArray *locations;
@property (nonatomic,strong) NSArray *rushChallenges;
@property (nonatomic) bool isGroupToday;

+ (id)sharedModel;
- (void)setGroups:(NSArray *)groupsData;
- (void)setAppUser:(NSDictionary *)appUserData;
- (void)setChallenges:(NSArray *)challengesData;
- (void)setLocations:(NSArray *)locationsData;
- (void)setRushChallenges:(NSArray *)rushChallengesData;

@end
