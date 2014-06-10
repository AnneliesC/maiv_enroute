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
}

@property (nonatomic,strong) NSArray *groups;
@property (nonatomic,strong) NSDictionary *appUser;

+ (id)sharedModel;
- (void)setGroups:(NSArray *)groupsData;
- (void)setAppUser:(NSDictionary *)appUserData;

@end
