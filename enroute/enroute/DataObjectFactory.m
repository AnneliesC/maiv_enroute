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

+ (Challenge *)createChallengeFromDictionary:(NSDictionary*)dictionary{
    Challenge *challenge = [[Challenge alloc] init];
    
    challenge.identifier = [[dictionary objectForKey:@"id"] integerValue];
    challenge.title = [dictionary objectForKey:@"title"];
    challenge.info = [dictionary objectForKey:@"info"];
    challenge.theme = [dictionary objectForKey:@"theme"];
    challenge.challenge_type = [dictionary objectForKey:@"challenge_type"];
    
    return challenge;
}

+ (Location *)createLocationFromDictionary:(NSDictionary*)dictionary{
    Location *participantLocation = [[Location alloc] init];
    
    participantLocation.userId = [[dictionary objectForKey:@"user_id"] integerValue];
    participantLocation.latitude = [[dictionary objectForKey:@"latitude"] doubleValue];
    participantLocation.longitude = [[dictionary objectForKey:@"longitude"] doubleValue];
    participantLocation.lost = [[dictionary objectForKey:@"lost"] boolValue];
    
    return participantLocation;
}

@end
