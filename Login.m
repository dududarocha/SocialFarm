//
//  Login.m
//  AppRural
//
//  Created by Andre Vinicius Alves Fonseca on 03/02/15.
//  Copyright (c) 2015 Adalto William dos Reis. All rights reserved.
//

#import "Login.h"
#import <Parse/Parse.h>
#import "SignUp.h"
#import "CentralUserController.h"


@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*///


- (IBAction)SignUp:(id)sender {
    SignUp *sign = [[SignUp alloc]init];
    
    [self presentViewController:sign animated:YES completion:NULL];

    
}

- (IBAction)Entrar:(id)sender {
    
    [PFUser logInWithUsernameInBackground:self.Username.text password:self.Password.text block:^(PFUser *user, NSError *error){
        if (user) {
            NSLog(@"logou com sucesso");
            
            [self dismissViewControllerAnimated:YES completion:NULL];
            
        }else{
            NSLog(@"login falhou");
            UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"ERRO" message:@"Usuario/senha incorreta " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alerta show];

        }
    }];
    
    
    
}
@end
