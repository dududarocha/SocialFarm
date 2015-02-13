//
//  CentralUserController.m
//  AppRural
//
//  Created by Adalto William dos Reis on 15/12/14.
//  Copyright (c) 2014 Adalto William dos Reis. All rights reserved.
//

#import "CentralUserController.h"
#import "CollectionViewCell_Custom.h"
#import <Parse/Parse.h>
#import "login.h"
#import "ConfigController.h"

@interface CentralUserController ()

@end

@implementation CentralUserController

- (void)viewDidLoad {
    
//    //salvando a foto do usuario
//    UIImage *image = [UIImage imageNamed:@"andre.jpg"];
//    
//    
//    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
//    PFFile *imageFile = [PFFile fileWithName:@"andre.jpg" data:imageData];
//    [imageFile saveInBackground];
//    
//    PFUser *user = [PFUser currentUser];
//    user[@"fotoPerfil"] = imageFile;
//    [user saveInBackground];
//    
//    
//    //setando a foto do usuario
//    //PFUser *user = [PFUser currentUser];
//    PFFile *userImageFile = user[@"fotoPerfil"];
//    [userImageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
//        if (!error) {
//            UIImage *image = [UIImage imageWithData:imageData];
//            
//            self.fotoPerfil.image = image;
//            
//            NSLog(@"pegou a imagem");
//        }else {
//            NSLog(@"nao pegou a imagem");
//        }
//    }];
    
//    PFUser *user = [PFUser currentUser];
//    PFFile *userImageFile = user[@"fotoPerfil"];
//    [userImageFile getDataInBackgroundWithBlock:<#^(NSData *data, NSError *error)block#>]
    
    //self.navigationController.navigationBar.translucent = NO;

    
    //    CGFloat tabBarHeight = 200.0;
//
//    self.tabBarController.tabBar.frame = CGRectMake(0,
//                                                    [[UIScreen mainScreen] bounds].size.height - tabBarHeight,
//                                                    [[UIScreen mainScreen] bounds].size.width,
//                                                    tabBarHeight);
    
    
    PFUser *user = [PFUser currentUser];
    PFFile *userImageFile = user[@"fotoPerfil"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {


            self.fotoPerfil.image = [UIImage imageWithData:imageData];
            //deixando a imagem redonda
            self.fotoPerfil.layer.cornerRadius = self.fotoPerfil.frame.size.width /2;
            self.fotoPerfil.clipsToBounds = YES;
        }
    }];
    
    //BOTAO ESQUERDO DA NAVIGATION
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editar)];
    
    
    //BOTAO DIREITO DA NAVIGATION
    
    UIImage *imagem  = [UIImage imageNamed:@"config@2x.png"];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:imagem style:UIBarButtonSystemItemEdit target:self action:@selector(editar)];
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    UINavigationController *nav =[[UINavigationController alloc]init];
    

    
    self.title = @"Perfil";
    
    
    
    [self addChildViewController:nav];
}


-(void) viewDidAppear:(BOOL)animated
{
    //pegando a foto do parse
    PFUser *user = [PFUser currentUser];
    PFFile *userImageFile = user[@"fotoPerfil"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            self.fotoPerfil.image = [UIImage imageWithData:imageData];
        }
    }];
    
    //verificando se o usuario esta logado
    if (![PFUser currentUser]) {
        NSLog(@"se cadastre fela da puta");
        
        Login *loginView = [[Login alloc]init];
        
        [self presentViewController:loginView animated:YES completion:NULL];

        
    }else{
        NSLog(@"ja ta logado");
    }
 
    //pegando o nome do usuario
    PFUser *currenteUser = [PFUser currentUser];
    if (currenteUser) {
        self.nomeUsuario.text = currenteUser[@"nome"];
//        self.nomeUsuario.text = currenteUser.username;
        self.email.text = currenteUser.email;
        NSLog(@"nome do usuario corrente: %@",currenteUser.username);
        
        
    }else {
        NSLog(@"nao deu certo");
    }
    
//    //salvando a foto do usuario
//    UIImage *image = [UIImage imageNamed:@"andre.jpg"];
//
//    
////    NSData *imageData = UIImagePNGRepresentation(image);
//    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
//    PFFile *imageFile = [PFFile fileWithName:@"andre.jpg" data:imageData];
//    [imageFile saveInBackground];
//    
//    PFUser *user = [PFUser currentUser];
//    user[@"fotoPerfil"] = imageFile;
//    [user saveInBackground];
//    
//    
//    //setando a foto do usuario
//    PFFile *userImageFile = user[@"fotoPerfil"];
//    [userImageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
//        if (!error) {
//            UIImage *image = [UIImage imageWithData:imageData];
//            
//            self.fotoPerfil.image = image;
//            
//            NSLog(@"pegou a imagem");
//        }else {
//            NSLog(@"nao pegou a imagem");
//        }
//    }];
    
    
    
//    PFFile *userImage = imageFile[@"fotoPerfil"];
//    [userImage getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
//        if (!error) {
//            UIImage *image = [UIImage imageWithData:imageData];
//        }
//    }];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
       
        
        UITabBarItem *tBarItem = self.tabBarItem;
        tBarItem.title = @"Perfil";
        UIImage *imagem  = [UIImage imageNamed:@"perfil_fill + Oval 60@2x.png"];
        tBarItem.image = imagem;
        

        
    }
    return self;
}

-(void)editar{
    ConfigController *config = [[ConfigController alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:config];

    
    [self presentViewController:nav animated:YES completion:NULL];
    
    
    
    
}



- (IBAction)LogOut:(id)sender {
    
    
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    if ((currentUser = nil)) {
        NSLog(@"deslogou");
        
        
        
    }else{
        NSLog(@" nao se deslogou");

    }
    
    Login *login = [[Login alloc]init];
    [self presentViewController:login animated:YES completion:NULL];
    
    
}
//adicionar anuncio
- (IBAction)AddAnun:(id)sender {
    
}
@end
