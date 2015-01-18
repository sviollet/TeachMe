//
//  DetailViewController.h
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercice.h"

@interface DetailExerciceViewController : UIViewController

@property (strong, nonatomic) Exercice* exercice;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

