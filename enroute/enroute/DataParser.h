//
//  DataParser.h
//  enroute
//
//  Created by Annelies Clauwaert on 10/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppModel.h"
#import "DataObjectFactory.h"

#import "Group.h"
#import "User.h"
#import "Challenge.h"
#import "RushChallenge.h"
#import "Location.h"

#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@interface DataParser : NSObject

- (void)loadGroupsData;

@end
