//
//  RegisterAnuncioViewController.m
//  AppRural
//
//  Created by Andre Vinicius Alves Fonseca on 04/02/15.
//  Copyright (c) 2015 Adalto William dos Reis. All rights reserved.
//

#import "RegisterAnuncioViewController.h"
#import <Parse/Parse.h>


@interface RegisterAnuncioViewController ()

@end

@implementation RegisterAnuncioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Novo Anuncio";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelar)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(salvar)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cancelar{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void)salvar{
    //salvando a foto do usuario
    
    PFObject *anuncio = [PFObject objectWithClassName:@"anuncio"];

    
    UIImage *image = self.imagem.image;
    if (self.imagem.image != NULL) {
        
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
        PFFile *imageFile = [PFFile fileWithName:@"anuncioImage.jpg" data:imageData];
        [imageFile saveInBackground];
        
        
        
        anuncio[@"anuncioImage"] = imageFile;

    }
    

    //salvando o objeto
    
    PFUser *currenteUser = [PFUser currentUser];
    
    
    anuncio[@"peso"] = self.peso.text;
    anuncio[@"preco"] = self.preco.text;
    anuncio[@"raca"] = self.raca.text;
    PFUser *user =  [PFUser currentUser];
    anuncio[@"anunciante"] = user.username;
    anuncio[@"usuario"] = [PFUser currentUser];
    anuncio[@"fotoPerfil"] = currenteUser[@"fotoPerfil"];
    
    [anuncio saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            NSLog(@"salvou o anuncio no parse");
            
        } else {
            // There was a problem, check error.description
            NSLog(@"nao salvou o anuncio no parse");

        }
    }];
    
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (IBAction)tirarFoto:(id)sender {
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
    
    self.imagem.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
