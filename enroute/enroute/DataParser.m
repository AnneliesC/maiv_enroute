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
        
       // [self showLoginRegister];
        
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

@end
