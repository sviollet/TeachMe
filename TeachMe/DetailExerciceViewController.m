//
//  DetailViewController.m
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import "DetailExerciceViewController.h"

@interface DetailExerciceViewController ()

@end

@implementation DetailExerciceViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(Exercice *)exercice {
    if (_exercice != exercice) {
        _exercice = exercice;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.exercice) {
        self.detailDescriptionLabel.text = _exercice.texte;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
