//
//  ExerciceCtrl.h
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCtrl.h"
#import "Exercice.h"

@interface ExerciceCtrl : BaseCtrl



//-(id)init;
-(NSArray*) GetExercices;
//-(void) Test:(SQLResult*)result;
//-(NSString*) TestExercices:(SEL) callback ;
-(Exercice*) GetExercice:(int) exId;

@end
