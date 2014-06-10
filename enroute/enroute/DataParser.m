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
    if([[[[AppModel sharedModel] appUser] objectForKey:@"role"]  isEqual: @"admin"] || [[[[AppModel sharedModel] appUser] objectForKey:@"role"]  isEqual: @"mentor"]){
        [self loadLocationsData];
    }
    
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
        NSLog(@"[DataParser] Error loading groups: %@", operation.error);
    }];
    
    [challengesOperation start];
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
        NSLog(@"[DataParser] Error loading groups: %@", operation.error);
    }];
    
    [locationsOperation start];
}

@end
