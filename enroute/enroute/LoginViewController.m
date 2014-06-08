//
//  LoginViewController.m
//  enroute
//
//  Created by Gilles Van de Ven on 7/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.RegistreerContainer.hidden=YES;
        
        
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[LoginView alloc]initWithFrame:bounds];
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view.registerUser addTarget:self action:@selector(registerUser:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.LoginUser addTarget:self action:@selector(loginUser:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view.txtMail addTarget:self action:@selector(textFieldFocusIn:) forControlEvents:UIControlEventEditingDidBegin];
    [self.view.txtMail addTarget:self action:@selector(textFieldFocusOut:) forControlEvents:UIControlEventEditingDidEnd];
    [self.view.txtPaswoord addTarget:self action:@selector(textFieldFocusIn:) forControlEvents:UIControlEventEditingDidBegin];
    [self.view.txtPaswoord addTarget:self action:@selector(textFieldFocusOut:) forControlEvents:UIControlEventEditingDidEnd];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    [self.view.btnLogin addTarget:self action:@selector(loginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnRegister addTarget:self action:@selector(registerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)textFieldFocusIn:(UITextField *)textField
{
    [self animateLoginContainer: textField up: YES];
}


- (void)textFieldFocusOut:(UITextField *)textField
{
    [self animateLoginContainer: textField up: NO];
}

- (void) animateLoginContainer: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 165;
    const float movementDuration = 0.4f;
    
    int movement = (up ? -movementDistance : 0);
    CGFloat alpha = (up ? 0 : 1);
    
    [UIView beginAnimations: @"loginContainerAnimation" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.view.loginContainer.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
    [UIView beginAnimations: @"loginBackgroundAnimation" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [self.view.backgroundImageLogin setAlpha:alpha];
    [UIView commitAnimations];
}

-(void)loginButtonTapped:(id)sender{
    NSLog(@"[LOGINVC]  login tapped");
    
    NSString *url = @"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/users";
    NSDictionary *parameters = @{
                                 @"email": self.view.txtMail.text,
                                 @"password": self.view.txtPaswoord.text,
                                 @"submit_type": @"login"
                                 };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //NSLog(@"[LOGINVC]  JSON: %@", operation.responseObject);
        
        //NSDictionary *user = [operation.responseObject objectForKey:@"user"];
        NSDictionary *errors = [operation.responseObject objectForKey:@"errors"];
        
        if([errors count] != 0){
            [self checkErrorsFromLogin:errors];
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn2"];
        }else{
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isUserLoggedIn2"];
            [self dismissViewControllerAnimated:YES completion:^{}];
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[LOGINVC] Error: %@", operation.error);
    }];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)checkErrorsFromLogin:(NSDictionary *)errors{
    NSLog(@"[LOGINVC]  login errors");
    
    BOOL errorMail = NO;
    BOOL errorPassword = NO;
    
    if([errors objectForKey:@"email"]) errorMail = YES;
    if([errors objectForKey:@"password"]) errorPassword = YES;
    
    [self.view handleErrorMessageMail:errorMail];
    [self.view handleErrorMessagePassword:errorPassword];
    
}

-(void)registerButtonTapped:(id)sender{
    NSLog(@"[LOGINVC] register tapped");
    
    // spreekt voor zich
    NSString *url = @"http://student.howest.be/annelies.clauwaert/20132014/MAIV/ENROUTE/api/users";
    
    NSDictionary *parameters = @{
                                 @"first_name": self.view.txtVoornaam.text,
                                 @"last_name": self.view.txtAchternaam.text,
                                 @"email": self.view.txtEmail.text,
                                 @"password": self.view.txtWachtwoord1.text,
                                 @"password2": self.view.txtWachtwoord2.text,
                                 @"group_id": @1,
                                 @"submit_type": @"register"
                                 };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"[LOGINVC]  JSON: %@", operation.responseObject);
        
        // NSDictionary *user = [operation.responseObject objectForKey:@"user"];
        NSDictionary *errors = [operation.responseObject objectForKey:@"errors"];
        
        if([errors count] != 0){
            
            [self checkErrorsFromRegister:errors];
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn2"];
            
        }else{
            
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isUserLoggedIn2"];
            [self dismissViewControllerAnimated:YES completion:^{}];
            
            
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.error);
    }];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)checkErrorsFromRegister:(NSDictionary *)errors{
    NSLog(@"[LOGINVC]  login errors");
    
    BOOL errorVoornaam = NO;
    BOOL errorAchternaam = NO;
    BOOL errorEmail = NO;
    BOOL errorWachtwoord1 = NO;
    BOOL errorWachtwoord2 = NO;
    
    if([errors objectForKey:@"first_name"]) errorVoornaam = YES;
    if([errors objectForKey:@"last_name"]) errorAchternaam = YES;
    if([errors objectForKey:@"email"]) errorEmail = YES;
    if([errors objectForKey:@"password"]) errorWachtwoord1 = YES;
    if([errors objectForKey:@"password2"]) errorWachtwoord2 = YES;
    
    [self.view handleErrorMessageVoornaam:errorVoornaam];
    [self.view handleErrorMessageAchternaam:errorAchternaam];
    [self.view handleErrorMessageEmail:errorEmail];
    [self.view handleErrorMessageWachtwoord1:errorAchternaam];
    [self.view handleErrorMessageWachtwoord2:errorAchternaam];
    
}

-(void)registerUser:(id)sender{
    
    
    //NSLog(@"[LOGINVC]  registereer");
    
    self.view.loginContainer.hidden=YES;
    self.view.RegistreerContainer.hidden=NO;
    
}
-(void)loginUser:(id)sender{
    
    
    //NSLog(@"[LOGINVC]  login");
    
    self.view.loginContainer.hidden=NO;
    self.view.RegistreerContainer.hidden=YES;
    
}
-(instancetype)initWithBounds:(CGRect)bounds{
    
    
    return [self initWithNibName:nil bundle:nil];
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
