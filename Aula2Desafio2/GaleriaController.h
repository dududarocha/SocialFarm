//
//  GaleriaController.h
//  AppRural
//
//  Created by Adalto William dos Reis on 16/12/14.
//  Copyright (c) 2014 Adalto William dos Reis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell_Custom.h"


@interface GaleriaController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic)NSArray *fotos;
@property(nonatomic, weak)NSDictionary *fotosDicionario;
@property (weak, nonatomic) IBOutlet UICollectionView *minhaCollection;
@property(nonatomic) CollectionViewCell_Custom *cel;

@end
