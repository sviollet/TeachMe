//
//  SQLManager.m
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import "SQLManager.h"

@implementation SQLManager

@synthesize db = _db;
@synthesize dataBaseName =_databaseName;
@synthesize dataBasePath = _databasePath;

// factory de SQLManager
+ (id)sharedManager {
    
    static SQLManager *sharedManager = nil;
    
    @synchronized(self) {
        if (sharedManager == nil) {
            sharedManager = [[self alloc] initDatabase:@"TeachMe.sqlite"];
            
            NSLog(sharedManager.dataBasePath);
            
            sharedManager.db = [FMDatabase databaseWithPath:sharedManager.dataBasePath];
            /**
            if ([sharedManager.db open]) {
                
                FMResultSet *s = [sharedManager.db executeQuery:@"SELECT Count(*) FROM Exercice"];
                
                if ([s next]) {
                    int totalCount = [s intForColumnIndex:0];
                    
                    NSLog(@"%i exercices chargés", totalCount);
                }
            }**/
            
        }
    }
    return sharedManager;
}

//Constructeur de classe
-(id)initDatabase:(NSString*)dataBaseName {
    
    if (self = [super init]) {
        //Nom de la base de données
        _databaseName = dataBaseName;
        
        // Obtenir le chemins complet de la base de donées
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [documentPaths objectAtIndex:0];
        _databasePath = [documentsDir stringByAppendingPathComponent:_databaseName];
        
        [self checkAndCreateDatabaseWithOverwrite:YES];
    }
    return self;
}


//Validation et creation de la base de donnees
-(void)checkAndCreateDatabaseWithOverwrite:(BOOL)overwriteDB {
    // BOOL qui servira de verification de l'existance de la BD
    BOOL success;
    
    // Objet pour faire des operations sur le systeme de fichiers
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // Verifier de la BD dans databasePath
    success = [fileManager fileExistsAtPath:_databasePath];
    
    // Retourner si la BD existe et que le BOOL overwriteDB n'est pas à oui
    if (success && !overwriteDB) {
        return;
    }
    
    // Chaines de caracteres avec le chemin de la BD dans l'app Bundle
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:_databaseName];
    
    // Copier la BD de l'app Bundle vers le repertoire de documents
    [fileManager copyItemAtPath:databasePathFromApp toPath:_databasePath error:nil];
}

/**
//Creation d'une liste des noms de colonnes pour obtenir son Index
- (NSDictionary *)indexByColumnName:(sqlite3_stmt *)init_statement {
    
    //Tableau des cles et des valeurs qui seront trouvees
    NSMutableArray *keys = [[NSMutableArray alloc] init];
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    //Nombre de colonnes
    int num_fields = sqlite3_column_count(init_statement);
    
    //Pour chaque colonne Ajout des donnees dans les Tableaux respectifs
    for(int index_value = 0; index_value < num_fields; index_value++) {
        const char* field_name = sqlite3_column_name(init_statement, index_value);
        if (!field_name){
            field_name="";
        }
        NSString *col_name = [NSString stringWithUTF8String:field_name];
        NSNumber *index_num = [NSNumber numberWithInt:index_value];
        [keys addObject:col_name];
        [values addObject:index_num];
    }
    //Creation du dictionnaire a partir des cles et valeurs obtenues
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    
    // Retourne le dictionnaire
    return dictionary;
}**/

@end
