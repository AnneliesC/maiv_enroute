//
//  DataParser.m
//  enroute
//
//  Created by Annelies Clauwaert on 10/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "DataParser.h"

@implementation DataParser

- (void)loadAppData{
    NSLog(@"[DataParser] Load app data");

    self.challengesLoaded = false;
    self.rushChallengesLoaded = true;
    self.locationsLoaded = true;
    
    if([[AppModel sharedModel] isMentor] == YES && [[AppModel sharedModel] isGroupToday]){
        
        self.rushChallengesLoaded = false;
        self.locationsLoaded = false;
        
        [self loadLocationsData];
        [self loadRushChallengesData];
        
    }
    
    [self loadChallengesData];
}

- (void)checkLoadingStatus{
    NSLog(@"[DataParser] Check loading status");
    
    if(self.challengesLoaded == YES && self.rushChallengesLoaded == YES && self.locationsLoaded == YES){
        NSLog(@"[DataParser] App data loaded");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"APP_DATA_LOADED" object:self];
    }
}

- (void)loadGroupsData{
    NSLog(@"[DataParser] Load groups");
    
    NSString *path = @"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/available/groups/";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *groupsOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    groupsOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    [groupsOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSMutableArray *groups = [[NSMutableArray alloc] init];
        for(NSDictionary *dict in operation.responseObject){
            NSLog(@"[DataParser] dict : %@", [DataObjectFactory createGroupFromDictionary:dict]);
            [groups addObject: [DataObjectFactory createGroupFromDictionary:dict]];
        }
        
        [[AppModel sharedModel] setGroups:groups];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[DataParser] Error loading groups: %@", operation.error);
    }];
    
    [groupsOperation start];
}

- (void)loadChallengesData{
    NSLog(@"[DataParser] Load challenges");
    
    NSString *path = [NSString stringWithFormat:@"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/challenges/hidden/group/%@", [[AppModel sharedModel] groupId]];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *challengesOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    challengesOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    [challengesOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSMutableArray *challenges = [[NSMutableArray alloc] init];
        for(NSDictionary *dict in operation.responseObject){
            NSLog(@"[DataParser] dict : %@", [DataObjectFactory createChallengeFromDictionary:dict]);
            [challenges addObject: [DataObjectFactory createChallengeFromDictionary:dict]];
        }
        
        [[AppModel sharedModel] setChallenges:challenges];
        self.challengesLoaded = true;
        [self checkLoadingStatus];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[DataParser] Error loading challenges: %@", operation.error);
        self.challengesLoaded = false;
        [self checkLoadingStatus];
    }];
    
    [challengesOperation start];
}

- (void)loadRushChallengesData{
    NSLog(@"[DataParser] Load rush challenges");
    
    NSString *path = @"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/challenges/rush/";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *rushChallengesOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    rushChallengesOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    [rushChallengesOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSMutableArray *rushChallenges = [[NSMutableArray alloc] init];
        for(NSDictionary *dict in operation.responseObject){
            NSLog(@"[DataParser] dict : %@", [DataObjectFactory createRushChallengeFromDictionary:dict]);
            [rushChallenges addObject: [DataObjectFactory createRushChallengeFromDictionary:dict]];
        }
        
        [[AppModel sharedModel] setRushChallenges:rushChallenges];
        self.rushChallengesLoaded = true;
        [self checkLoadingStatus];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[DataParser] Error loading rush challenges: %@", operation.error);
        self.rushChallengesLoaded = false;
        [self checkLoadingStatus];
    }];
    
    [rushChallengesOperation start];
}

- (void)loadLocationsData{
    NSLog(@"[DataParser] Load locations");
    
    NSString *path = [NSString stringWithFormat:@"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/locations/group/%@", [[AppModel sharedModel] groupId]];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *locationsOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    locationsOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    [locationsOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSMutableArray *locations = [[NSMutableArray alloc] init];
        for(NSDictionary *dict in operation.responseObject){
            NSLog(@"[DataParser] dict : %@", [DataObjectFactory createLocationFromDictionary:dict]);
            [locations addObject: [DataObjectFactory createLocationFromDictionary:dict]];
        }
        
        [[AppModel sharedModel] setLocations:locations];
        self.locationsLoaded = true;
        [self checkLoadingStatus];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[DataParser] Error loading locations: %@", operation.error);
        self.locationsLoaded = false;
        [self checkLoadingStatus];
    }];
    
    [locationsOperation start];
}

-(void)uploadRushChallengeWithGroupId:(int)groupId challengeId:(int)challengeId andDuration:(int)duration{
     NSLog(@"[DataParser] Upload rush challenge");
    
    NSString *url = @"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/challenges/rush/group";
    
    NSDictionary *parameters = @{
                                 @"group_id": [NSNumber numberWithInt:groupId],
                                 @"challenge_id": [NSNumber numberWithInt:challengeId],
                                 @"duration": [NSNumber numberWithInt:duration]
                                 };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", operation.responseObject);
        [[AppModel sharedModel] setRushChallengePushed:YES];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.error);
    }];
}

@end
