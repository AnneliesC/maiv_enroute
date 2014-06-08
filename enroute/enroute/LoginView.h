//
//  LoginView.h
//  enroute
//
//  Created by Gilles Van de Ven on 7/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

@property (nonatomic,strong) UIImageView *backgroundImageLogin;
@property (nonatomic,strong) UIImageView *HeaderImage;

@property(nonatomic,strong)UITextField *txtMail;
@property (nonatomic,strong) UIImageView *iconMail;
@property(nonatomic,strong)UITextField *txtPaswoord;
@property (nonatomic,strong) UIImageView *iconPaswoord;

@property(nonatomic,strong)UIButton *btnLogin;

@property (nonatomic,strong) UIView *loginContainer;
@property (nonatomic,strong) UIView *RegistreerContainer;

-(void)showErrorMessageMail;
-(void)showErrorMessagePas;

@property (nonatomic, strong) UIButton *registerUser;

@property (nonatomic,strong) UIImageView *backgroundImageRegister;

@property(nonatomic,strong)UITextField *txtVoornaam;
@property(nonatomic,strong)UITextField *txtAchternaam;
@property(nonatomic,strong)UITextField *txtEmail;
@property(nonatomic,strong)UITextField *txtWachtwoord1;
@property(nonatomic,strong)UITextField *txtWachtwoord2;

@property(nonatomic,strong)UIButton *btnRegister;

@property (nonatomic, strong) UIButton *LoginUser;

@end
