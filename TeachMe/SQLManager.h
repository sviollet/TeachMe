//
//  SQLManager.h
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDatabase.h>


@interface SQLManager : NSObject

@property (nonatomic, retain) FMDatabase* db;
@property(nonatomic,retain)NSString*dataBaseName; // Nom du fichier de la base de donnees
@property(nonatomic,retain)NSString*dataBasePath; // Chemin complet de la base de donnees

+ (id)sharedManager;
//-(void) checkAndCreateDatabaseWithOverwrite:(BOOL)overwriteDB;
//- (NSDictionary *)indexByColumnName:(sqlite3_stmt *)init_statement;

@end
