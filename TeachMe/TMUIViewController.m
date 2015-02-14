//
//  TMUIViewController.m
//  TeachMe
//
//  Created by Samuel Viollet on 14/02/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import "TMUIViewController.h"

@interface TMUIViewController ()

@end

@implementation TMUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    
    
    [self customizeBackButton];
}

-(void)customizeBackButton {
    

    
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
