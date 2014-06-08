//
//  DataObjectFactory.h
//  enroute
//
//  Created by Annelies Clauwaert on 8/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"

@interface DataObjectFactory : NSObject

+ (Group *)createGroupFromDictionary:(NSDictionary*)dictionary;

@end
