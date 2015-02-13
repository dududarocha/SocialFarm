//
//  CustomCell.h
//  AppRural
//
//  Created by Andre Vinicius Alves Fonseca on 28/01/15.
//  Copyright (c) 2015 Adalto William dos Reis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *peso;

@property (weak, nonatomic) IBOutlet UILabel *preco;
@property (weak, nonatomic) IBOutlet UILabel *raca;

@property (weak, nonatomic) IBOutlet UIImageView *fotoPerfil;
@end
