//
//  RushChallengesTableViewController.h
//  enroute
//
//  Created by Gilles Van de Ven on 13/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"
#import "RushChallenge.h"
#import "DataObjectFactory.h"
#import "RushChallengesTableViewCell.h"
#import "RushChallengesDetailViewController.h"





@interface RushChallengesTableViewController : UITableViewController

@property(nonatomic,strong)NSArray *rushChallenges;


@end
