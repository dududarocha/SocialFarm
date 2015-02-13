//
//  SignUp.h
//  AppRural
//
//  Created by Andre Vinicius Alves Fonseca on 03/02/15.
//  Copyright (c) 2015 Adalto William dos Reis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUp : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *email;

- (IBAction)goBack:(id)sender;

- (IBAction)go:(id)sender;

- (IBAction)back:(id)sender;
@end
