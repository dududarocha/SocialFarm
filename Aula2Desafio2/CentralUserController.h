//
//  CentralUserController.h
//  AppRural
//
//  Created by Adalto William dos Reis on 15/12/14.
//  Copyright (c) 2014 Adalto William dos Reis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell_Custom.h"


@interface CentralUserController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nomeUsuario;
@property (weak, nonatomic) IBOutlet UIImageView *fotoPerfil;
@property (weak, nonatomic) IBOutlet UILabel *email;

@property (weak, nonatomic) IBOutlet UISegmentedControl *SegmentControl;


- (IBAction)LogOut:(id)sender;

- (IBAction)AddAnun:(id)sender;


@end
