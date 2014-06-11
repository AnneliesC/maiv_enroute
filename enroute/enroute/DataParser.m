//
//  DataParser.m
//  enroute
//
//  Created by Annelies Clauwaert on 10/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "DataParser.h"

@implementation DataParser

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

- (void)loadAppData{
    
    [self loadChallengesData];
    
    [self getGroupByDate];
    
    if(([[[[AppModel sharedModel] appUser] objectForKey:@"role"]  isEqual: @"admin"] ||
       [[[[AppModel sharedModel] appUser] objectForKey:@"role"]  isEqual: @"mentor"])
       && [[AppModel sharedModel] isGroupToday]){
        
        
        [self loadLocationsData];
        [self loadRushChallengesData];
    }
    
}

- (void)getGroupByDate{
    NSLog(@"[DataParser] Get group by date");
    
    NSString *path = [NSString stringWithFormat:@"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/groups/date/%@", [Helpers getCurrentDateAsStringRaw]];
    NSLog(@"[DataParser] path: %@", path);
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *groupOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    groupOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    [groupOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSLog(@"[DataParser] succes: %@", operation.responseObject);
//        NSMutableArray *group = [[NSMutableArray alloc] init];
//        for(NSDictionary *dict in operation.responseObject){
//            NSLog(@"[DataParser] dict : %@", [DataObjectFactory createChallengeFromDictionary:dict]);
//            [group addObject: [DataObjectFactory createChallengeFromDictionary:dict]];
//        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[DataParser] Error loading groups: %@", operation.error);
    }];
    
    [groupOperation start];
}

- (void)loadChallengesData{
    NSLog(@"[DataParser] Load challenges");
    
    NSString *path = [NSString stringWithFormat:@"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/challenges/hidden/group/%@", [[[AppModel sharedModel] appUser] objectForKey:@"group_id"]];
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
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[DataParser] Error loading challenges: %@", operation.error);
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
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[DataParser] Error loading rush challenges: %@", operation.error);
    }];
    
    [rushChallengesOperation start];
}

- (void)loadLocationsData{
    NSLog(@"[DataParser] Load locations");
    
    NSString *path = [NSString stringWithFormat:@"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/locations/group/%@", [[[AppModel sharedModel] appUser] objectForKey:@"group_id"]];
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
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[DataParser] Error loading locations: %@", operation.error);
    }];
    
    [locationsOperation start];
}

@end
