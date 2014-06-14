//
//  OverviewViewController.m
//  enroute
//
//  Created by Annelies Clauwaert on 12/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "OverviewViewController.h"

@interface OverviewViewController ()

@property (nonatomic,strong) OverviewView *view;
@property (nonatomic,strong) NSArray *locations;
@property (nonatomic,strong) DataParser *dataparser;

@end

@implementation OverviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationController.navigationBarHidden = NO;
        
        self.locations = [[AppModel sharedModel] locations];
        self.dataparser = [[DataParser alloc] init];
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[OverviewView alloc]initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBarHidden = NO;
    
    [self.view.btnLocation addTarget:self action:@selector(updateLocations:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)updateLocations:(id)sender{
    [self.dataparser loadLocationsData];
    self.locations = [[AppModel sharedModel] locations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
