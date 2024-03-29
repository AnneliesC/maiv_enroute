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
    challenge.challengeType = [dictionary objectForKey:@"challenge_type"];
    
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

+ (RushChallenge *)createRushChallengeFromDictionary:(NSDictionary*)dictionary{
    RushChallenge *rushChallenge = [[RushChallenge alloc] init];
    
    rushChallenge.identifier = [[dictionary objectForKey:@"id"] integerValue];
    rushChallenge.title = [dictionary objectForKey:@"title"];
    rushChallenge.info = [dictionary objectForKey:@"info"];
    rushChallenge.challengeType = [dictionary objectForKey:@"challenge_type"];
    
    return rushChallenge;
}

+ (RushChallenge *)createGroupRushChallengeFromDictionary:(NSDictionary*)dictionary{
    RushChallenge *rushChallenge = [[RushChallenge alloc] init];
    
    rushChallenge.identifier = [[dictionary objectForKey:@"id"] integerValue];
    rushChallenge.title = [dictionary objectForKey:@"title"];
    rushChallenge.info = [dictionary objectForKey:@"info"];
    rushChallenge.challengeType = [dictionary objectForKey:@"challenge_type"];
    rushChallenge.timePushed = [dictionary objectForKey:@"datetime"];
    rushChallenge.duration = [[dictionary objectForKey:@"duration"] intValue];
    
    return rushChallenge;
}

//+ (Result *)createResultFromDictionary:(NSDictionary*)dictionary{
//    RushChallenge *rushChallenge = [[RushChallenge alloc] init];
//    
//    rushChallenge.identifier = [[dictionary objectForKey:@"id"] integerValue];
//    rushChallenge.title = [dictionary objectForKey:@"title"];
//    rushChallenge.info = [dictionary objectForKey:@"info"];
//    rushChallenge.challengeType = [dictionary objectForKey:@"challenge_type"];
//    rushChallenge.timePushed = [dictionary objectForKey:@"datetime"];
//    rushChallenge.duration = [[dictionary objectForKey:@"duration"] intValue];
//    
//    return rushChallenge;
//}

@end
