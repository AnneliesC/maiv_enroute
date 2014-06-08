//
//  LoginView.h
//  enroute
//
//  Created by Gilles Van de Ven on 7/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView<UIPickerViewDelegate>

@property (nonatomic,strong) UIImageView *headerImage;
@property (nonatomic,strong) UIImageView *backgroundImageLogin;
@property (nonatomic,strong) UIImageView *backgroundImageRegister;

@property (nonatomic,strong) UIImageView *iconMail;
@property (nonatomic,strong) UIImageView *iconMailError;
@property (nonatomic,strong) UITextField *txtLoginEmail;
@property (nonatomic,strong) UIImageView *iconPaswoord;
@property (nonatomic,strong) UIImageView *iconPaswoordError;
@property (nonatomic,strong) UITextField *txtLoginPassword;

@property (nonatomic,strong) UITextField *txtRegisterFirstName;
@property (nonatomic,strong) UITextField *txtRegisterLastName;
@property (nonatomic,strong) UITextField *txtRegisterEmail;
@property (nonatomic,strong) UITextField *txtRegisterPassword1;
@property (nonatomic,strong) UITextField *txtRegisterPassword2;
@property (nonatomic,strong) UIPickerView *slctGroup;

@property (nonatomic,strong) UIButton *btnLogin;
@property (nonatomic, strong) UIButton *registerUser;
@property (nonatomic,strong) UIButton *btnRegister;
@property (nonatomic, strong) UIButton *LoginUser;

@property (nonatomic,strong) UIView *loginContainer;
@property (nonatomic,strong) UIView *registerContainer;

-(void)handleErrorMessageMail:(BOOL)error;
-(void)handleErrorMessagePassword:(BOOL)error;

-(void)handleErrorMessageVoornaam:(BOOL)error;
-(void)handleErrorMessageAchternaam:(BOOL)error;
-(void)handleErrorMessageEmail:(BOOL)error;
-(void)handleErrorMessageWachtwoord1:(BOOL)error;
-(void)handleErrorMessageWachtwoord2:(BOOL)error;

@property (nonatomic) NSInteger padding;

@end
