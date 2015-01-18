//
//  DetailViewController.h
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

