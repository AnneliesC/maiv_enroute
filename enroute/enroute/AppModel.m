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

@end
