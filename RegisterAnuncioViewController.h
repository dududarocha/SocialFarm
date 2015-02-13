//
//  RegisterAnuncioViewController.h
//  AppRural
//
//  Created by Andre Vinicius Alves Fonseca on 04/02/15.
//  Copyright (c) 2015 Adalto William dos Reis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterAnuncioViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
- (IBAction)tirarFoto:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *peso;
@property (weak, nonatomic) IBOutlet UITextField *preco;
@property (weak, nonatomic) IBOutlet UITextField *raca;
@end
