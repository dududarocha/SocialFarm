//
//  CentralAnuncioViewController.m
//  AppRural
//
//  Created by Adalto William dos Reis on 15/12/14.
//  Copyright (c) 2014 Adalto William dos Reis. All rights reserved.
//

#import "CentralAnuncioViewController.h"
#import "CustomCell.h"
#import "RegisterAnuncioViewController.h"
#import <Parse/Parse.h>


@interface CentralAnuncioViewController ()

@end

@implementation CentralAnuncioViewController


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        UITabBarItem *tBarItem = self.tabBarItem;
        tBarItem.title = @"Anúncios";
        UIImage *imagem  = [UIImage imageNamed:@"anuncios_outline@2x.png"];
        tBarItem.image = imagem;
        

        
        
        
        
    }
    return self;
}

-(void) loadData{
//    [self.anuncios removeAllObjects];
//    
//    PFQuery *AnunciosData = [PFQuery queryWithClassName:@"anuncio"];
//    [AnunciosData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
//        if (!error) {
//            for (PFObject *object in objects) {
//                [self.anuncios addObject:object];
//            }
//            
//            NSArray *array = [self.anuncios.reverseObjectEnumerator allObjects];
//            
//            //convertendo array em multableArray
//            NSMutableArray *Mutablearray = [[NSMutableArray alloc]initWithArray:array];
//            
//            self.anuncios = Mutablearray;
//            
//            [self.minhaTableView reloadData];
//        }
//    }];
    
    [self.objetos removeAllObjects];
    
    PFQuery *QtdAnuncios = [ PFQuery queryWithClassName:@"anuncio"];
    self.quantidadeObejto =  [QtdAnuncios findObjects];
    
    self.quantidadeObejto = [[self.quantidadeObejto reverseObjectEnumerator] allObjects];
    
    self.objetos = [[NSMutableArray alloc]initWithArray:self.quantidadeObejto];
    
    
   // [self.objetos.reverseObjectEnumerator allObjects];
   // [self.quantidadeObejto.reverseObjectEnumerator allObjects];
    
    
    [self.minhaTableView reloadData];
    
    
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self loadData];
    [self.minhaTableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.minhaTableView.delegate = self;
    
    //registrando a nib para usar a celula customizada
    [self.minhaTableView registerNib:[UINib nibWithNibName:@"CustomCell"
                                                    bundle:[NSBundle mainBundle]]
              forCellReuseIdentifier:@"Cell"];
    
    
    //pegando dados do plist
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"contacts" ofType:@"plist"];
//    self.contatosArray = [NSArray arrayWithContentsOfFile: path];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(openRegisterAnuncio)];
    
    
    
    self.title = @"Anuncios";
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
   // return self.contatosArray.count;
    return self.quantidadeObejto.count;
    
    
    
}


//tamanho da customcell da tableview
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 375.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath ];
    
    self.contatoDicionario = self.objetos[indexPath.row];
    
    
    customCell.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];

    
    //pegando o objeto do parse
    PFObject *objeto = [self.objetos objectAtIndex:indexPath.row];
    
    NSString *peso = [objeto objectForKey:@"peso"];
    NSString *preco =[objeto objectForKey:@"preco"];
    NSString *raca = [objeto objectForKey:@"raca"];
    NSString *nome = [objeto objectForKey:@"anunciante"];
    
    
    
    //pegando o foto do parse
    PFFile *userImageFile = [objeto objectForKey:@"anuncioImage"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            customCell.image.image = [UIImage imageWithData:imageData];
        }
    }];

    
    //atribuindo conteudo para os elementos da custim cell
    customCell.peso.text = peso;
    customCell.preco.text = preco;
    customCell.raca.text = raca;
    //customCell.userName.text = nome;
    
    
    
    

    
    return customCell;
    

}

-(void)openRegisterAnuncio{
    
    RegisterAnuncioViewController *registerr = [[RegisterAnuncioViewController alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:registerr];
    
    [self presentViewController:nav animated:YES completion:nil];
    
}










@end



