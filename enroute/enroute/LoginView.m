//
//  LoginView.m
//  enroute
//
//  Created by Gilles Van de Ven on 7/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:249/255.0f green:249/255.0f blue:249/255.0f alpha:1];
        self.padding = 10;
        
        CGRect bounds = [UIScreen mainScreen].bounds;
        self.loginContainer = [[UIView alloc] initWithFrame:bounds];
        [self addSubview:self.loginContainer];
        
        self.RegistreerContainer = [[UIView alloc] initWithFrame:bounds];
        [self addSubview:self.RegistreerContainer];
        
        [self createBackground];
        [self createInputFields];
        [self createButton];
    }
    return self;
}

-(void)createBackground{
    
    self.HeaderImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_Header"]];
    [self addSubview:self.HeaderImage];
    
    //Login
    
    self.backgroundImageLogin = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Background_login"]];
    [self.loginContainer addSubview:self.backgroundImageLogin];
    
    //Register
    
    self.backgroundImageRegister = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Register_background"]];
    [self.RegistreerContainer addSubview:self.backgroundImageRegister];
}

-(void)createInputFields{
    
    //Login
    
    //email input
    
    self.txtMail = [[UITextField alloc]initWithFrame:CGRectMake(80, 350, 415/2 , 77/2)];
    self.txtMail.placeholder = @"E-mailadres";
    self.txtMail.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.loginContainer addSubview:self.txtMail];
    
    UIView *spaceMailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtMail setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtMail setLeftView:spaceMailView];
    
    self.iconMail = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_Email"]];
    self.iconMail.frame=CGRectMake(33, 350, 47, 38);
    [self.loginContainer addSubview:self.iconMail];
    
    //paswoord input
    
    self.txtPaswoord = [[UITextField alloc]initWithFrame:CGRectMake(80, 400, 415/2 , 77/2)];
    self.txtPaswoord.placeholder = @" Wachtwoord";
    self.txtPaswoord.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    self.txtPaswoord.secureTextEntry=YES;
    [self.loginContainer addSubview:self.txtPaswoord];
    
    UIView *spacePaswoordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtPaswoord setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtPaswoord setLeftView:spacePaswoordView];
    
    self.iconPaswoord = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_wachtwoord"]];
    self.iconPaswoord.frame=CGRectMake(33, 400, 47, 38);
    [self.loginContainer addSubview:self.iconPaswoord];
    
    //Registreer
    
    //Voornaam
    
    self.txtVoornaam = [[UITextField alloc]initWithFrame:CGRectMake(33, 242, 244/2 , 77/2)];
    self.txtVoornaam.placeholder = @"Voornaam";
    self.txtVoornaam.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.RegistreerContainer addSubview:self.txtVoornaam];
    
    UIView *spaceVoornaamView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtVoornaam setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtVoornaam setLeftView:spaceVoornaamView];
    
    //Naam
    
    self.txtAchternaam = [[UITextField alloc]initWithFrame:CGRectMake(332/2, 242, 244/2 , 77/2)];
    self.txtAchternaam.placeholder = @"Achternaam";
    self.txtAchternaam.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.RegistreerContainer addSubview:self.txtAchternaam];
    
    UIView *spaceAchternaamView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtAchternaam setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtAchternaam setLeftView:spaceAchternaamView];
    
    //Email
    self.txtEmail = [[UITextField alloc]initWithFrame:CGRectMake(33, 293, 255 , 77/2)];
    self.txtEmail.placeholder = @"Email";
    self.txtEmail.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.RegistreerContainer addSubview:self.txtEmail];
    
    UIView *spaceEmailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtEmail setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtEmail setLeftView:spaceEmailView];
    
    //wachtwoord1
    
    self.txtWachtwoord1 = [[UITextField alloc]initWithFrame:CGRectMake(33, 345, 244/2 , 77/2)];
    self.txtWachtwoord1.placeholder = @"Wachtwoord1";
    self.txtWachtwoord1.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.RegistreerContainer addSubview:self.txtWachtwoord1];
    
    UIView *spaceWachtwoord1View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtWachtwoord1 setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtWachtwoord1 setLeftView:spaceWachtwoord1View];
    
    //wachtwoord2
    
    self.txtWachtwoord2 = [[UITextField alloc]initWithFrame:CGRectMake(332/2, 345, 244/2 , 77/2)];
    self.txtWachtwoord2.placeholder = @"Wachtwoord2";
    self.txtWachtwoord2.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.RegistreerContainer addSubview:self.txtWachtwoord2];
    
    UIView *spaceWachtwoord2View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
    [self.txtWachtwoord2 setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtWachtwoord2 setLeftView:spaceWachtwoord2View];
}

-(void)createButton{
    
    //Login
    
    UIImage *backgroundButtonLogin = [UIImage imageNamed:@"login_Button"];
    
    self.btnLogin= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogin.frame=CGRectMake(33, 450, backgroundButtonLogin.size.width, backgroundButtonLogin.size.height);
    [self.btnLogin setBackgroundImage:backgroundButtonLogin forState:UIControlStateNormal];
    [self.btnLogin setTitle:@"" forState:UIControlStateNormal];
    [self.loginContainer addSubview:self.btnLogin];
    
    self.registerUser = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.registerUser setTitleColor:[UIColor colorWithRed:66/255.0f green:78/255.0f blue:81/255.0f alpha:1] forState:UIControlStateNormal];
    [self.registerUser setTitle:@"Nog geen account" forState:UIControlStateNormal];
    self.registerUser.frame = CGRectMake(33, 505, 130, 15);
    [self.loginContainer addSubview:self.registerUser];
    
    //Register
    
    UIImage *backgroundButtonRegister = [UIImage imageNamed:@"Register_button"];
    
    self.btnRegister= [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRegister.frame=CGRectMake(33, 450, backgroundButtonRegister.size.width, backgroundButtonRegister.size.height);
    [self.btnRegister setBackgroundImage:backgroundButtonRegister forState:UIControlStateNormal];
    [self.btnRegister setTitle:@"" forState:UIControlStateNormal];
    [self.RegistreerContainer addSubview:self.btnRegister];
    
    self.LoginUser = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.LoginUser setTitleColor:[UIColor colorWithRed:66/255.0f green:78/255.0f blue:81/255.0f alpha:1] forState:UIControlStateNormal];
    [self.LoginUser setTitle:@"Ik heb al een account" forState:UIControlStateNormal];
    self.LoginUser.frame = CGRectMake(33, 505, 150, 15);
    [self.RegistreerContainer addSubview:self.LoginUser];
}

-(void)handleErrorMessageMail:(BOOL)error{
    
    if(error){
        self.txtMail.layer.borderColor=[[UIColor colorWithRed:252/255.0f green:122/255.0f blue:115/255.0f alpha:1]CGColor];
        self.txtMail.layer.borderWidth=1;
    }else{
        self.txtMail.layer.borderColor=[[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]CGColor];
        self.txtMail.layer.borderWidth=1;
    }
}

-(void)handleErrorMessagePassword:(BOOL)error{
    
    if(error){
        self.txtPaswoord.layer.borderColor=[[UIColor colorWithRed:252/255.0f green:122/255.0f blue:115/255.0f alpha:1]CGColor];
        self.txtPaswoord.layer.borderWidth=1;
    }else{
        self.txtPaswoord.layer.borderColor=[[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]CGColor];
        self.txtPaswoord.layer.borderWidth=1;
    }
}

-(void)showErrorMessageVoornaam{
    
    NSLog(@"[LOGINVIEW] Voornaam is fout");
    
    //Register
    
    
}

-(void)showErrorMessageAchternaam{
    
    NSLog(@"[LOGINVIEW] Achternaam is fout");
    
    //Register
    
    
}
-(void)showErrorMessageEmail{
    
    NSLog(@"[LOGINVIEW] Email is fout");
    
    //Register
    
    
}
-(void)showErrorMessageWachtwoord1{
    
    NSLog(@"[LOGINVIEW] wachtwoord1 is fout");
    
    //Register
    
    
}
-(void)showErrorMessageWachtwoord2{
    
    NSLog(@"[LOGINVIEW] wachtwoord2 is fout");
    
    //Register
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
