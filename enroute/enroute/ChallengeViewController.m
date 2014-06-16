//
//  ChallengeViewController.m
//  enroute
//
//  Created by Gilles Van de Ven on 14/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "ChallengeViewController.h"

@interface ChallengeViewController ()

@end

@implementation ChallengeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationController.navigationBarHidden = NO;
    }
    return self;
}

- (id)initWithChallenge:(Challenge *)challenge{
    
    self.challenge = challenge;
    return [self initWithNibName:nil bundle:nil];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[ChallengeView alloc]initWithFrame:bounds andChallenge:self.challenge];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBarHidden = NO;
    
    [self.view.btnStart addTarget:self action:@selector(startChallenge:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnBack addTarget:self action:@selector(showPrevious:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)startChallenge:(id)sender{
    NSLog(@"challenge type: %@",self.challenge.challengeType);
    
    NSString *challengeType = [NSString stringWithFormat:@"%@",self.challenge.challengeType];
    
    [self showImagePickerForType:@"audio"];
    if([challengeType  isEqual: @"photo"]){
        [self showImagePickerForType:@"audio"];
    }else if([challengeType  isEqual: @"video"]){
        [self showImagePickerForType:@"video"];
    }else if([challengeType  isEqual: @"audio"]){
        // audio
    }else if([challengeType  isEqual: @"silhouet"]){
    
    }
    
}

-(void)showImagePickerForType:(NSString*)imagePickerType{
    NSLog(@"%@",imagePickerType);
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] )
    {
        NSLog(@"[ChallengeVC] Camera device available");
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        if([imagePickerType  isEqual: @"photo"]){
            imagePicker.mediaTypes = [NSArray arrayWithObject:@"public.image"];
            imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        }else if ([imagePickerType  isEqual: @"video"]){
            NSLog(@"[ChallengeVC] Camera video available");
            imagePicker.mediaTypes = [NSArray arrayWithObject:@"public.movie"];
            imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
            [imagePicker setVideoMaximumDuration:5];
        }
        
    }else{
        NSLog(@"[ChallengeVC] No camera device available");
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePicker animated:YES completion:^{}];
    imagePicker.delegate = self;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.view.btnStart.enabled = FALSE;
    // save result in keyed archive
    // go to result page
    // ignore challenge
    
    NSLog(@"[OverViewVC] Did finish picking media: %@", [info objectForKey:UIImagePickerControllerMediaType]);
    
    if([[info objectForKey:UIImagePickerControllerMediaType]  isEqual: @"public.image"]){
        UIImage *photo = [info objectForKey:UIImagePickerControllerOriginalImage];
       // [self uploadPhoto:photo];
    }else if ([[info objectForKey:UIImagePickerControllerMediaType]  isEqual: @"public.movie"])
    {
        NSURL * mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
       // [self uploadVideo:mediaURL];
    }else{
        NSLog(@"no mediatype");
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *photo = [info objectForKey:UIImagePickerControllerOriginalImage];
     
     [picker dismissViewControllerAnimated:YES completion:^{}];
    // [self uploadPhoto:photo];
}

-(void)showPrevious:(id)sender{
    [[self navigationController] popViewControllerAnimated:NO];
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
