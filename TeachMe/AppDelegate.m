//
//  AppDelegate.m
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailExerciceViewController.h"
#import "SQLManager.h"
#import "ExerciceCtrl.h"

#import <FMDB.h>

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Creation de l'instance (le constructeur est donc initie)
    //Execution de la methode de validation de l'existance de la BD

    
    //NSString*test = [[[ExerciceCtrl alloc] init] TestExercices:@selector(Test:)];
    
    //NSLog(@"result = %@", test);
    /**
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"TeachMe.sqlite"];

    [[SQLManager sharedManager] checkAndCreateDatabaseWithOverwrite:NO];
 
    FMDatabase* db = [FMDatabase databaseWithPath:writableDBPath];
    
    NSLog([db open]?@"ok" : @"Error");
    
    if ([db open]) {
        
        FMResultSet *s = [db executeQuery:@"SELECT Count(*) FROM Exercice"];
        
        if ([s next]) {
            int totalCount = [s intForColumnIndex:0];
            
            NSLog(@"%i exercices chargés", totalCount);
        }
    }**/
    
    
    ExerciceCtrl *test = [[ExerciceCtrl alloc] init];
    [test GetExercices];
    
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    splitViewController.delegate = self;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailExerciceViewController class]] && ([(DetailExerciceViewController *)[(UINavigationController *)secondaryViewController topViewController] exercice] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

@end
