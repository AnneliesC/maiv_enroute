//
//  DataObjectFactory.m
//  enroute
//
//  Created by Annelies Clauwaert on 8/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "DataObjectFactory.h"

@implementation DataObjectFactory

+ (Group *)createGroupFromDictionary:(NSDictionary*)dictionary{
    Group *group = [[Group alloc] init];
    
    group.identifier = [[dictionary objectForKey:@"id"] integerValue];
    group.date = [dictionary objectForKey:@"date"];
    group.participants = [[dictionary objectForKey:@"participants"] integerValue];
    group.groupLimit = [[dictionary objectForKey:@"groupLimit"] integerValue];
    
    return group;
}

@end
