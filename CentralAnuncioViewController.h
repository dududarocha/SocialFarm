//
//  CentralAnuncioViewController.h
//  AppRural
//
//  Created by Adalto William dos Reis on 15/12/14.
//  Copyright (c) 2014 Adalto William dos Reis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CentralAnuncioViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

//dictionary pra pegar os arquivos da plist
@property(nonatomic) NSDictionary *contatoDicionario;



@property(nonatomic,weak)IBOutlet UITableView *minhaTableView;
@property(nonatomic)NSArray *contatosArray;

@property(nonatomic)NSArray *quantidadeObejto;
@property(nonatomic)NSMutableArray *objetos;


@end
