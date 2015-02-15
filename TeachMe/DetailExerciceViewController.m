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
    

    
    //UIImage *backgroundImage = [UIImage imageNamed:@"bottomPage.png"];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    // Do any additional setup after loading the view, typically from a nib.
    //[self configureView];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.toolbarHidden = NO;

    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_validate"] style:UIBarButtonItemStyleDone target:self action:                @selector(validateExercice)];
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
}

-(void)validateExercice {
    NSLog(@"validation");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
