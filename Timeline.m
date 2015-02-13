//
//  Timeline.m
//  AppRural
//
//  Created by Andre Vinicius Alves Fonseca on 04/02/15.
//  Copyright (c) 2015 Adalto William dos Reis. All rights reserved.
//

#import "Timeline.h"

@interface Timeline ()

@end

@implementation Timeline

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    
    self.title = @"Configuracoes";
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
        tBarItem.title = @"Configuracoes";
        UIImage *imagem  = [UIImage imageNamed:@"configuracoes_fill@2x.png"];
        tBarItem.image = imagem;
        self.tabBarController.view.tintColor = [UIColor whiteColor];
        

        
    }
    return self;
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
