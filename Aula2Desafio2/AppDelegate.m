//
//  AppDelegate.m
//  Aula2Desafio2
//
//  Created by Adalto William dos Reis on 19/05/14.
//  Copyright (c) 2014 Adalto William dos Reis. All rights reserved.
//

#import "AppDelegate.h"
#import "CentralUserController.h"
#import "CentralAnuncioViewController.h"
#import "GaleriaController.h"
#import "ConfigController.h"
#import <Parse/Parse.h>
#import "Timeline.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //first commit test
    //second commit test
    
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"enQVgqaPX6GLEkn8x0yioXcfmfLWvcaM4nvFhn02"
                  clientKey:@"43sIE8K0LgjDtQnfUFxUpdIBnmEfrFqp5L62UdOk"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    //aqui criamos as views
    CentralUserController *viewUser = [[CentralUserController alloc]init];
    CentralAnuncioViewController *viewAnuncio = [[CentralAnuncioViewController alloc]init];
    GaleriaController *viewGaleria = [[GaleriaController alloc]init];
    Timeline *viewTimeLine = [[Timeline alloc]init];

    
    
    NSMutableArray *tabs = [[NSMutableArray alloc]init];
    
    
    //cria a tabbar, que vai ser a rootViewController
    UITabBarController *tab = [[UITabBarController alloc]init];
    
    //seta a cor da tabbar background
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:14.0/255.0 green:39.0/255.0 blue:43.0/255.0 alpha:0]];
    [tab.tabBar setTranslucent:NO];
    
    
    //seta a cor dos tabbar icon quando selecionado
    tab.view.tintColor = [UIColor whiteColor];
    
    //cria a navigationController e inicia ela com uma view Controller
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewUser];
    UINavigationController *nav2 =[[UINavigationController alloc]initWithRootViewController:viewAnuncio];
    UINavigationController *nav3 =[[UINavigationController alloc]initWithRootViewController:viewGaleria];
    UINavigationController *nav4 =[[UINavigationController alloc]initWithRootViewController:viewTimeLine];
    
    
    
    //cores das navigtion
    
    nav.navigationBar.barTintColor = [UIColor colorWithRed:14.0/255.0 green:39.0/255.0 blue:43.0/255.0 alpha:1.0];
    nav.navigationBar.translucent = NO;


    nav2.navigationBar.barTintColor = [UIColor colorWithRed:14.0/255.0 green:39.0/255.0 blue:43.0/255.0 alpha:1.00];
    nav2.navigationBar.translucent = NO;
    
    nav3.navigationBar.barTintColor = [UIColor colorWithRed:14.0/255.0 green:39.0/255.0 blue:43.0/255.0 alpha:1.00];
    nav3.navigationBar.translucent = NO;
    
    nav4.navigationBar.barTintColor = [UIColor colorWithRed:14.0/255.0 green:39.0/255.0 blue:43.0/255.0 alpha:1.00];
    nav4.navigationBar.translucent = NO;
    
    

   
    
    
    [tabs addObject:nav];
    [tabs addObject:nav2];
    [tabs addObject:nav3];
    [tabs addObject:nav4];
    tab.viewControllers = tabs;
    
    self.window.rootViewController = tab;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
 
    
    NSLog(@"entrou");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    

    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    

    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
