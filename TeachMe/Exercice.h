//
//  Exercice.h
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercice : NSObject

@property (nonatomic) int id;
@property (nonatomic,retain) NSString*libelle;
@property (nonatomic,retain) NSString*description;
@property (nonatomic, retain) NSString*url;

@end
