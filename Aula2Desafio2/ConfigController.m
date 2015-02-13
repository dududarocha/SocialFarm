//
//  ConfigController.m
//  AppRural
//
//  Created by Adalto William dos Reis on 16/12/14.
//  Copyright (c) 2014 Adalto William dos Reis. All rights reserved.
//

#import "ConfigController.h"
#import <Parse/Parse.h>


@interface ConfigController ()

@end

@implementation ConfigController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    PFUser *user = [PFUser currentUser];
    self.UsuarioNome.text = user[@"nome"];

    
    PFFile *userImageFile = user[@"fotoPerfil"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            self.fotoUsuario.image = [UIImage imageWithData:imageData];
        }
    }];


    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(voltar)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(salvar)];
    
    UINavigationController *nav =[[UINavigationController alloc]init];
    self.title = @"Configurações";
    
    [self addChildViewController:nav];
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
        tBarItem.title = @"Configurações";
        UIImage *imagem  = [UIImage imageNamed:@"config.png"];
        tBarItem.image = imagem;
        

        
    }
    return self;
}

- (void)voltar{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)alterarImagem:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    //determinando a a delegate da imagePicker
    imagePicker.delegate = self;
    
    
    //permitindo que a imagem seja editada
    imagePicker.allowsEditing = YES;
    
    
    
    [self presentViewController:imagePicker animated:YES completion:nil];

}

//salvando a imagem
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    self.fotoUsuario.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}
-(void)salvar{
    
    PFUser *user = [PFUser currentUser];
    
    //salvando a foto do usuario
    if (self.fotoUsuario.image != NULL) {
        UIImage *image = self.fotoUsuario.image;
        
        
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
        PFFile *imageFile = [PFFile fileWithName:@"photo.jpg" data:imageData];
        [imageFile saveInBackground];
        
        user[@"fotoPerfil"] = imageFile;
    }
    
    
    
    
    
    
    
    user[@"nome"] = self.UsuarioNome.text;
    [user saveInBackground];
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
}












@end
