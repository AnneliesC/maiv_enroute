//
//  MainViewController.m
//  enroute
//
//  Created by Gilles Van de Ven on 7/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //[self loadGroupsData];

    }
    return self;
}

- (void)loadGroupsData{
    NSLog(@"[MainVC] Load groups");
    
    NSString *path = @"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/available/groups/";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *groupsOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    groupsOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    [groupsOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        
        [self showLoginRegister];
        
        NSMutableArray *groups = [[NSMutableArray alloc] init];
        for(NSDictionary *dict in operation.responseObject){
            NSLog(@"[MainVC] dict : %@", [DataObjectFactory createGroupFromDictionary:dict]);
            [groups addObject: [DataObjectFactory createGroupFromDictionary:dict]];
        }
        
        [[AppModel sharedModel] setGroups:groups];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[MainVC] Error loading groups: %@", operation.error);
    }];
    
    [groupsOperation start];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[MainView alloc]initWithFrame:bounds];
}

- (void)viewDidLoad{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    self.view.scrollView.delegate=self;
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    int index = (scrollView.contentOffset.x / scrollView.frame.size.width);
    self.view.pageControl.currentPage = index;
}

-(void)viewDidAppear:(BOOL)animated{
}

- (void)showLoginRegister{
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn2"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLoggedIn2"] == NO){
        self.loginVC = [[LoginViewController alloc]initWithBounds:self.view.bounds];
        [self presentViewController:self.loginVC animated:NO completion:^{}];
    }
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
