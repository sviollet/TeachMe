//
//  BaseCtrl.h
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "SQLManager.h"

@interface BaseCtrl : NSObject

@property (nonatomic, retain)SQLManager*sqlManager;

-(BOOL) connectToDaBase;
-(BOOL) disconnectToDataBase;

@end
