//
//  Login.h
//  AppRural
//
//  Created by Andre Vinicius Alves Fonseca on 03/02/15.
//  Copyright (c) 2015 Adalto William dos Reis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController 
@property (weak, nonatomic) IBOutlet UITextField *Username;
@property (weak, nonatomic) IBOutlet UITextField *Password;


- (IBAction)SignUp:(id)sender;


- (IBAction)Entrar:(id)sender;

@end
