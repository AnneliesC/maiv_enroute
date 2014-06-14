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
        
        self.registerContainer = [[UIView alloc] initWithFrame:bounds];
        [self addSubview:self.registerContainer];
        
        [self createBackground];
        [self createInputFields];
        [self createButton];
        
    }
    return self;
}


-(void)createBackground{
    
    self.HeaderImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginHeader"]];
    [self addSubview:self.headerImage];
    
    //Login
    
    self.backgroundImageLogin = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Background_login"]];
    [self.loginContainer addSubview:self.backgroundImageLogin];
    
    //Register
    
    self.backgroundImageRegister = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Register_background"]];
    [self.registerContainer addSubview:self.backgroundImageRegister];
}

-(void)createInputFields{
    
    //Login
    
    //email input
    
    self.txtLoginEmail = [[UITextField alloc]initWithFrame:CGRectMake(80, 350, 415/2 , 77/2)];
    self.txtLoginEmail.placeholder = @"E-mailadres";
    self.txtLoginEmail.font=[UIFont fontWithName:@"Droid Serif" size:15];
    self.txtLoginEmail.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.loginContainer addSubview:self.txtLoginEmail];
    
    UIView *spaceMailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtLoginEmail setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtLoginEmail setLeftView:spaceMailView];
    
    self.iconMail = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_Email"]];
    self.iconMail.frame=CGRectMake(33, 350, 47, 38);
    [self.loginContainer addSubview:self.iconMail];
    
    //paswoord input
    
    self.txtLoginPassword = [[UITextField alloc]initWithFrame:CGRectMake(80, 400, 415/2 , 77/2)];
    self.txtLoginPassword.placeholder = @" Wachtwoord";
    self.txtLoginPassword.font=[UIFont fontWithName:@"Droid Serif" size:15];
    self.txtLoginPassword.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    self.txtLoginPassword.secureTextEntry=YES;
    [self.loginContainer addSubview:self.txtLoginPassword];
    
    UIView *spacePaswoordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtLoginPassword setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtLoginPassword setLeftView:spacePaswoordView];
    
    self.iconPaswoord = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_wachtwoord"]];
    self.iconPaswoord.frame=CGRectMake(33, 400, 47, 38);
    [self.loginContainer addSubview:self.iconPaswoord];
    
    //Registreer
    
    //Voornaam
    
    self.txtRegisterFirstName = [[UITextField alloc]initWithFrame:CGRectMake(33, 242, 244/2 , 77/2)];
    self.txtRegisterFirstName.placeholder = @"Voornaam";
    self.txtRegisterFirstName.font=[UIFont fontWithName:@"Droid Serif" size:15];
    self.txtRegisterFirstName.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.registerContainer addSubview:self.txtRegisterFirstName];
    
    UIView *spaceVoornaamView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtRegisterFirstName setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtRegisterFirstName setLeftView:spaceVoornaamView];
    
    //Naam
    
    self.txtRegisterLastName = [[UITextField alloc]initWithFrame:CGRectMake(332/2, 242, 244/2 , 77/2)];
    self.txtRegisterLastName.placeholder = @"Achternaam";
    self.txtRegisterLastName.font=[UIFont fontWithName:@"Droid Serif" size:15];
    self.txtRegisterLastName.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.registerContainer addSubview:self.txtRegisterLastName];
    
    UIView *spaceAchternaamView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtRegisterLastName setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtRegisterLastName setLeftView:spaceAchternaamView];
    
    //Email
    self.txtRegisterEmail = [[UITextField alloc]initWithFrame:CGRectMake(33, 293, 255 , 77/2)];
    self.txtRegisterEmail.placeholder = @"Email";
    self.txtRegisterEmail.font=[UIFont fontWithName:@"Droid Serif" size:15];
    self.txtRegisterEmail.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.registerContainer addSubview:self.txtRegisterEmail];
    
    UIView *spaceEmailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtRegisterEmail setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtRegisterEmail setLeftView:spaceEmailView];
    
    //wachtwoord1
    
    self.txtRegisterPassword1 = [[UITextField alloc]initWithFrame:CGRectMake(33, 345, 244/2 , 77/2)];
    self.txtRegisterPassword1.placeholder = @"Wachtwoord1";
    self.txtRegisterPassword1.font=[UIFont fontWithName:@"Droid Serif" size:15];
    self.txtRegisterPassword1.secureTextEntry=YES;
    self.txtRegisterPassword1.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.registerContainer addSubview:self.txtRegisterPassword1];
    
    UIView *spaceWachtwoord1View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, self.padding)];
    [self.txtRegisterPassword1 setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtRegisterPassword1 setLeftView:spaceWachtwoord1View];
    
    //wachtwoord2
    
    self.txtRegisterPassword2 = [[UITextField alloc]initWithFrame:CGRectMake(332/2, 345, 244/2 , 77/2)];
    self.txtRegisterPassword2.placeholder = @"Wachtwoord2";
    self.txtRegisterPassword2.font=[UIFont fontWithName:@"Droid Serif" size:15];
    self.txtRegisterPassword2.secureTextEntry=YES;
    self.txtRegisterPassword2.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self.registerContainer addSubview:self.txtRegisterPassword2];
    
    UIView *spaceWachtwoord2View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
    [self.txtRegisterPassword2 setLeftViewMode:UITextFieldViewModeAlways];
    [self.txtRegisterPassword2 setLeftView:spaceWachtwoord2View];
    
    //selectGroup
    
//    self.slctGroup = [[UIPickerView alloc] initWithFrame:CGRectMake(33, 293, 255 , 300/2)];
//    self.slctGroup.delegate = self;
//    self.slctGroup.showsSelectionIndicator = YES;
//    [self addSubview:self.slctGroup];
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
    [self.registerContainer addSubview:self.btnRegister];
    
    self.LoginUser = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.LoginUser setTitleColor:[UIColor colorWithRed:66/255.0f green:78/255.0f blue:81/255.0f alpha:1] forState:UIControlStateNormal];
    [self.LoginUser setTitle:@"Ik heb al een account" forState:UIControlStateNormal];
    self.LoginUser.frame = CGRectMake(33, 505, 150, 15);
    [self.registerContainer addSubview:self.LoginUser];
}

-(void)handleErrorMessageMail:(BOOL)error{
    
    if(error){
        self.txtLoginEmail.layer.borderColor = [[UIColor colorWithRed:252/255.0f green:122/255.0f blue:115/255.0f alpha:1]CGColor];
        self.txtLoginEmail.layer.borderWidth = 1;
        
        self.iconMail = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_Emai_error"]];
        self.iconMail.frame=CGRectMake(33, 350, 47, 38);
        [self.loginContainer addSubview:self.iconMail];
        
    }else{
        self.txtLoginEmail.layer.borderColor=[[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]CGColor];
        self.txtLoginEmail.layer.borderWidth=1;
        
        self.iconMail = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_Email"]];
        self.iconMail.frame=CGRectMake(33, 350, 47, 38);
        [self.loginContainer addSubview:self.iconMail];
    }
}

-(void)handleErrorMessagePassword:(BOOL)error{
    
    if(error){
        self.txtLoginPassword.layer.borderColor=[[UIColor colorWithRed:252/255.0f green:122/255.0f blue:115/255.0f alpha:1]CGColor];
        self.txtLoginPassword.layer.borderWidth=1;
        
        self.iconPaswoord = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_wachtwoord_error"]];
        self.iconPaswoord.frame=CGRectMake(33, 400, 47, 38);
        [self.loginContainer addSubview:self.iconPaswoord];
        
    }else{
        self.txtLoginPassword.layer.borderColor=[[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]CGColor];
        self.txtLoginPassword.layer.borderWidth=1;
        
        self.iconPaswoord = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_wachtwoord"]];
        self.iconPaswoord.frame=CGRectMake(33, 400, 47, 38);
        [self.loginContainer addSubview:self.iconPaswoord];
    }
}

-(void)handleErrorMessageVoornaam:(BOOL)error{
    
    if(error){
        self.txtRegisterFirstName.layer.borderColor=[[UIColor colorWithRed:252/255.0f green:122/255.0f blue:115/255.0f alpha:1]CGColor];
        self.txtRegisterFirstName.layer.borderWidth=1;
    }else{
        self.txtRegisterFirstName.layer.borderColor=[[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]CGColor];
        self.txtRegisterFirstName.layer.borderWidth=1;
        
    }
}

-(void)handleErrorMessageAchternaam:(BOOL)error{
    
    if(error){
        self.txtRegisterLastName.layer.borderColor=[[UIColor colorWithRed:252/255.0f green:122/255.0f blue:115/255.0f alpha:1]CGColor];
        self.txtRegisterLastName.layer.borderWidth=1;
    }else{
        self.txtRegisterLastName.layer.borderColor=[[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]CGColor];
        self.txtRegisterLastName.layer.borderWidth=1;
    }
}
-(void)handleErrorMessageEmail:(BOOL)error{
    
    if(error){
        self.txtRegisterEmail.layer.borderColor=[[UIColor colorWithRed:252/255.0f green:122/255.0f blue:115/255.0f alpha:1]CGColor];
        self.txtRegisterEmail.layer.borderWidth=1;
    }else{
        self.txtRegisterEmail.layer.borderColor=[[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]CGColor];
        self.txtRegisterEmail.layer.borderWidth=1;
        
    }
}
-(void)handleErrorMessageWachtwoord1:(BOOL)error{
    
    if(error){
        self.txtRegisterPassword1.layer.borderColor=[[UIColor colorWithRed:252/255.0f green:122/255.0f blue:115/255.0f alpha:1]CGColor];
        self.txtRegisterPassword1.layer.borderWidth=1;
    }else{
        self.txtRegisterPassword1.layer.borderColor=[[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]CGColor];
        self.txtRegisterPassword1.layer.borderWidth=1;
    }
}
-(void)handleErrorMessageWachtwoord2:(BOOL)error{
    
    if(error){
        self.txtRegisterPassword2.layer.borderColor=[[UIColor colorWithRed:252/255.0f green:122/255.0f blue:115/255.0f alpha:1]CGColor];
        self.txtRegisterPassword2.layer.borderWidth=1;
        
    }else{
        self.txtRegisterPassword2.layer.borderColor=[[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]CGColor];
        self.txtRegisterPassword2.layer.borderWidth=1;
    }
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
