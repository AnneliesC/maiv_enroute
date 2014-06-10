//
//  MenuView.h
//  enroute
//
//  Created by Gilles Van de Ven on 9/06/14.
//  Copyright (c) 2014 Annelies Clauwaert. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MenuView : UIView

@property (nonatomic,strong) UIImageView *frameImage;

@property (nonatomic,strong) UIButton *btnThemas;
@property (nonatomic,strong) UIButton *btnMap;
@property (nonatomic,strong) UIButton *btnOpdrachten;
@property (nonatomic,strong) UIButton *btnGebruiker;

@property (nonatomic,strong) UIButton *btnLogout;


@end
