//
//  BaseCtrl.m
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import "BaseCtrl.h"

@implementation BaseCtrl

@synthesize sqlManager = _sqlManager;

-(id) init {
    
    self = [super init];
    _sqlManager = [SQLManager sharedManager];
    
    return self;
}

-(BOOL) connectToDaBase {
    
    return [_sqlManager.db open];
    
}

-(BOOL) disconnectToDataBase {
    return [_sqlManager.db close];
}

/**
-(id) DoRequest:(NSString*) request callback:(SEL) callback {
    
    sqlite3 *database;
    
    //Declaration de notre String qui sera retourne
    NSString *usernameString = [NSString string];
    
    SQLManager*sqlManager = [SQLManager sharedManager];
    
    // Ouverture de la base de donnees
    if(sqlite3_open([sqlManager.dataBasePath UTF8String], &database) == SQLITE_OK) {
        
        //REQUETE EN PARAMETRE
        
        //Chaine de caracteres de la requete
        //const char *sqlStatement = "SELECT libelle FROM Exercice WHERE id = 1";
        
        const char *sqlStatement = [[NSString stringWithFormat:request] UTF8String];
        
        //Creation de l'objet statement
        sqlite3_stmt *compiledStatement;
        
        //Compilation de la requete et verification du succes
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            // Creation d'un dictionnaire des noms de colonnes
            NSDictionary *dictionary = [sqlManager indexByColumnName:compiledStatement];
            
            SQLResult *result = [[SQLResult alloc] init:compiledStatement dictionnary:dictionary];
            
            [self performSelector:callback withObject:result];
        }
        else {
            //Envois une exception en cas de probleme de requete
            NSAssert1(0, @"Erreur :. '%s'", sqlite3_errmsg(database));
        }
        
        // Finalisation de la requete pour liberer la memoire
        sqlite3_finalize(compiledStatement);
        
    }
    else {
        //Envois une exception en cas de probleme d'ouverture
        NSAssert(0, @"Erreur d'ouverture de la base de donnees");
    }
    
    //Fermer la base de donnees
    sqlite3_close(database);
    
    
    return usernameString;
}**/

@end
