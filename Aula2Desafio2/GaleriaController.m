//
//  GaleriaController.m
//  AppRural
//
//  Created by Adalto William dos Reis on 16/12/14.
//  Copyright (c) 2014 Adalto William dos Reis. All rights reserved.
//

#import "GaleriaController.h"

@interface GaleriaController ()

@end

@implementation GaleriaController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.minhaCollection registerNib:[UINib nibWithNibName:@"CollectionViewCell_Custom" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    
    //pegando dados do plist
    NSString *path  = [[NSBundle mainBundle]pathForResource:@"nomes" ofType:@"plist"];
    self.fotos = [NSArray arrayWithContentsOfFile:path];
    
    //setando a cor de fundo da collectionView
    self.minhaCollection.backgroundColor = [UIColor whiteColor];
    
    
    UINavigationController *nav =[[UINavigationController alloc]init];
    
    self.title = @"Galeria";
    
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
        tBarItem.title = @"Galeria";
        UIImage *imagem  = [UIImage imageNamed:@"galeria_fill@2x.png"];
        tBarItem.image = imagem;
        

        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.fotos.count;
    
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.cel = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //colocando as parada do array no dictionary
    self.fotosDicionario = self.fotos[indexPath.item];
    
    //    cel.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"boi5.jpg"]];
    
    NSString *imagem = self.fotosDicionario[@"nome"];
    
    UIImage *image = [UIImage imageNamed:imagem];
    
    self.cel.backgroundView = [[UIImageView alloc] initWithImage:image];
    
    
    
    
    
    
    return self.cel;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
