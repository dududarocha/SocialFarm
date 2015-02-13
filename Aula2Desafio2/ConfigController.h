//
//  ConfigController.h
//  AppRural
//
//  Created by Adalto William dos Reis on 16/12/14.
//  Copyright (c) 2014 Adalto William dos Reis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *UsuarioNome;
@property (weak, nonatomic) IBOutlet UIImageView *fotoUsuario;
- (IBAction)alterarImagem:(id)sender;

@end
