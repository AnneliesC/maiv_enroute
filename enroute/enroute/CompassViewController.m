//
//  CompassViewController.m
//  enroute
//
//  Created by Gilles Van de Ven on 11/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "CompassViewController.h"

@interface CompassViewController ()

@property (nonatomic,strong) NSMutableArray *challengesInRange;
@property (nonatomic,strong) NSMutableArray *challengeTargets;
@property (nonatomic,strong) Challenge *previousChallenge;

@property (nonatomic,strong) CLLocation *lastLocation;
@property (nonatomic) double latitudeMinimum;
@property (nonatomic) double latitudeMaximum;
@property (nonatomic) double longitudeMinimum;
@property (nonatomic) double longitudeMaximum;
@property (nonatomic) int regionMargin;
@property (nonatomic) int regionSize;
@property (nonatomic) int distanceMaximum;
@property (nonatomic) int distanceMinimum;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) NSArray *challenges;
@property (nonatomic,strong) NSMutableArray *challengesWithCoordinates;
@property (nonatomic,strong) NSMutableArray *challengeRegions;

@end

@implementation CompassViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationController.navigationBarHidden = NO;
        
        self.challenges = [[AppModel sharedModel] challenges];
        NSLog(@"[CompassVC] CHALLENGES: %@", self.challenges);
        
        self.challengeTargets = [[NSMutableArray alloc]init];
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        //        self.latitudeMaximum = 50.819391;
        //        self.latitudeMinimum = 50.823525;
        //        self.longitudeMinimum = 3.254616;
        //        self.longitudeMaximum = 3.262878;
        
        self.latitudeMaximum = 50.817816;
        self.latitudeMinimum = 50.821165;
        self.longitudeMinimum = 3.272395;
        self.longitudeMaximum = 3.276922;
        
        self.regionSize = 90;
        self.regionMargin = 50;
        
        self.distanceMaximum = 300;
        self.distanceMinimum = 20;

    }
    return self;
}
- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[CompassView alloc]initWithFrame:bounds];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBarHidden = NO;
    
    [self.view.btnCloseButton addTarget:self action:@selector(ignoreChallenge:) forControlEvents:UIControlEventTouchUpInside];
    
    if([CLLocationManager locationServicesEnabled]){
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        self.locationManager.distanceFilter = 0.5;
        self.locationManager.activityType = CLActivityTypeOther;
    }
    
    if ([CLLocationManager headingAvailable]) {
        self.locationManager.headingFilter = 0.5;
    }
    
    [self createChallengeRegions];
}

-(void)ignoreChallenge:(id)sender{
    NSLog(@"ignore challenge");
    self.challengesInRange = nil;
    self.previousChallenge = self.selectedChallenge;
    [self.view hideChallengeButton];
    [self checkChallengesInRange];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"[CompassVC] Location updated");
    
    // size targets aanpassen
    
    self.lastLocation = [locations lastObject];
    if([locations lastObject]){
        [self createChallengeTargets];
    }
    
    NSDate *eventDate = self.lastLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    
    if( abs(howRecent) < 2.0) {
        [self checkChallengesInRange];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    
    float heading = newHeading.magneticHeading;
    float angle = (heading*M_PI/180);
    
    self.view.challengeTargetsContainer.transform = CGAffineTransformMakeRotation(-angle);
    
    for(ChallengeTarget *challengeTarget in self.challengeTargets){
        challengeTarget.transform = CGAffineTransformMakeRotation(angle);
    }
}

- (void)createChallengeRegions{
    NSLog(@"[CompassVC] Create challenge regions");
    
    self.challengesWithCoordinates = [[NSMutableArray alloc] init];
    
    for(Challenge *challenge in self.challenges){
        NSLog(@"%@", challenge);
        
        CLLocation *challengeCoordinate = [self randomCoordinateFromLatitudeMinimum:self.latitudeMinimum latitudeMaximum:self.latitudeMaximum longitudeMinimum:self.longitudeMinimum andLongitudeMaximum:self.longitudeMaximum];
        
        for(Challenge *challengeWithCoordinate in self.challengesWithCoordinates){
            
            CLLocation *challengeCoordinateFromchallengeWithCoordinate = [[CLLocation alloc] initWithLatitude:challengeWithCoordinate.latitude longitude:challengeWithCoordinate.longitude];
            
            do
            {
                challengeCoordinate = [self randomCoordinateFromLatitudeMinimum:self.latitudeMinimum latitudeMaximum:self.latitudeMaximum longitudeMinimum:self.longitudeMinimum andLongitudeMaximum:self.longitudeMaximum];
                
            }while([challengeCoordinate distanceFromLocation:challengeCoordinateFromchallengeWithCoordinate] < (self.regionSize*2+self.regionMargin));
        }
        
        challenge.latitude = challengeCoordinate.coordinate.latitude;
        challenge.longitude = challengeCoordinate.coordinate.longitude;
        
        [self.challengesWithCoordinates addObject:challenge];
    }
    
    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
}

-(CLLocation*)randomCoordinateFromLatitudeMinimum:(float)latitudeMinimum latitudeMaximum:(float)latitudeMaximum longitudeMinimum:(float)longitudeMinimum andLongitudeMaximum:(float)longitudeMaximum{
    
    double latitude = (double)[self randomFloatBetween:(float)self.latitudeMinimum and:(float)self.latitudeMaximum];
    double longitude = (double)[self randomFloatBetween:(float)self.longitudeMinimum and:(float)self.longitudeMaximum];
    CLLocation *challengeCoordinate = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    return challengeCoordinate;
}

-(void)createChallengeTargets{
    NSLog(@"[CompassVC] Create challenge targets");
    
    for(ChallengeTarget *challengeTarget in self.challengeTargets){
        [challengeTarget removeFromSuperview];
    }
    self.challengeTargets = [[NSMutableArray alloc]init];
    
    for(Challenge *challenge in self.challenges){
        
        double xPosOrigin = (double)self.lastLocation.coordinate.longitude;
        double yPosOrigin = (double)self.lastLocation.coordinate.latitude;
        double xPosTarget = (double)challenge.longitude;
        double yPosTarget = (double)challenge.latitude;
        
        double deltaX = (xPosTarget - xPosOrigin);
        double deltaY = (yPosTarget - yPosOrigin);
        
        double distance = sqrt(deltaX*deltaX + deltaY*deltaY);
        double xPos = (deltaX/distance)*110;
        double yPos = (deltaY/distance)*110;
        
        CLLocation *challengeLocation = [[CLLocation alloc] initWithLatitude:challenge.latitude longitude:challenge.longitude];
        double size = [self mapValue:[self.lastLocation distanceFromLocation:challengeLocation]
                      fromInputStart:self.distanceMinimum inputEnd:self.distanceMaximum outputStart:75 outputEnd:20];
        if([self.lastLocation distanceFromLocation:challengeLocation] > self.distanceMaximum){
            size = 20;
        }else if ([self.lastLocation distanceFromLocation:challengeLocation] < self.distanceMinimum){
            size = 75;
        }
        
        ChallengeTarget *challengeTarget = [[ChallengeTarget alloc] initWithFrame:CGRectMake(0, 0,size, size) andTheme:challenge.theme];
        challengeTarget.center = CGPointMake(212/2+xPos,212/2-yPos);
        [self.challengeTargets addObject:challengeTarget];
        [self.view.challengeTargetsContainer addSubview:challengeTarget];
    }
}

-(void)checkChallengesInRange{
    NSLog(@"[CompassVC] Check challenges in range");
    
    self.challengesInRange = [[NSMutableArray alloc]init];
    
    for(Challenge *challenge in self.challenges){
        
        CLLocation *challengeLocation = [[CLLocation alloc] initWithLatitude:challenge.latitude longitude:challenge.longitude];
        
        if([self.lastLocation distanceFromLocation:challengeLocation] < self.regionSize  && self.previousChallenge != challenge){
            [self.challengesInRange addObject:challenge];
        }
    }
    
    double distance = 0;
    self.selectedChallenge = nil;
    NSLog(@"[CompassVC] Challengs in range: %@",self.challengesInRange);
    for(Challenge *challengeInRange in self.challengesInRange){
        
        CLLocation *challengeLocation = [[CLLocation alloc] initWithLatitude:challengeInRange.latitude longitude:challengeInRange.longitude];
        if([self.lastLocation distanceFromLocation:challengeLocation] > distance  && self.previousChallenge != challengeInRange){
            distance = [self.lastLocation distanceFromLocation:challengeLocation];
            self.selectedChallenge = challengeInRange;
        }
    }
    
    if([self.challengesInRange count] != 0){
        [self checkChallengeInRange];
    }else{
        self.selectedChallenge = nil;
    }
}

-(void)checkChallengeInRange{
    NSLog(@"[CompassVC] Check challenge in range");
    
    if(self.selectedChallenge != nil){
        NSLog(@"[CompassVC] Challenge in range");
        [self.view showChallengeButtonForChallenge:self.selectedChallenge];
        
    }else{
        NSLog(@"[CompassVC] No challenges in range");
        if(self.view.btnChallenge.hidden == TRUE) [self.view hideChallengeButton];
        [self checkChallengesInRange];
    }
}

- (double)mapValue:(double)value fromInputStart:(double)inputStart inputEnd:(double)inputEnd outputStart:(double)outputStart outputEnd:(double)outputEnd{
    double inputRange = inputEnd - inputStart;
    double outputRange = outputEnd - outputStart;
    return ((value - inputStart)*outputRange / inputRange + outputStart);
}

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber {
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
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
