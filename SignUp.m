//
//  SignUp.m
//  AppRural
//
//  Created by Andre Vinicius Alves Fonseca on 03/02/15.
//  Copyright (c) 2015 Adalto William dos Reis. All rights reserved.
//

#import "SignUp.h"
#import <Parse/Parse.h>
#import "CentralUserController.h"
#import "Login.h"


@interface SignUp ()

@end

@implementation SignUp

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

- (IBAction)goBack:(id)sender {
}

- (IBAction)go:(id)sender {
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
    
    PFUser *user = [PFUser user];
    user.username = self.username.text;
    user.password = self.passWord.text;
    user.email = self.email.text;
    
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (!error){
            NSLog(@"logou");
            
            CentralUserController *centralControle = [[CentralUserController alloc]init];
            
            
            [self presentViewController:centralControle animated:YES completion:NULL];
            
        
            
        }else{
            NSString *errorString = [error userInfo][@"error"];
        }
    }];
    
    
}

- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
