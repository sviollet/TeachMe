//
//  ExerciceCtrl.m
//  TeachMe
//
//  Created by Samuel Viollet on 17/01/2015.
//  Copyright (c) 2015 AppiaPace. All rights reserved.
//

#import "ExerciceCtrl.h"

@implementation ExerciceCtrl

// constructeur de la classe
-(id)init{
    
    return [super init];
}

-(NSArray*) GetExercices{
    
    if ([self connectToDaBase]) {
        
        FMResultSet *s = [self.sqlManager.db executeQuery:@"SELECT * FROM Exercice"];
        while ([s next]) {
            NSLog([s objectForColumnName:@"description"]);
            
        }
        [self disconnectToDataBase];
    }
    
    return [[NSArray alloc] init];
}

/**
-(void) Test:(SQLResult*)result {
    
    
    NSLog(@"coucou");
    
    while(sqlite3_step(result.compiledStatement) == SQLITE_ROW) {
        
        // A SEPARER DANS UNE DELEGUER
        
        //Assigne la valeur dans la chaine de caracteres
        char * str = (char *)sqlite3_column_text(result.compiledStatement, [[result.dictionnary objectForKey:@"description"] intValue]);
        if (!str){
            str=" ";
        }
        //Convertion de la chaine vers un NSString pour retourner la valeur
        //usernameString = [NSString stringWithUTF8String:str];
        
    }
    
}

// Permet de récupérer l'ensembles des exercices
-(NSString*) TestExercices:(SEL) callback {
    
    //NSArray* result = [[NSArray alloc] init];
    
    // get all the exercices
    
    //Declaration d'un objet SQLITE
    sqlite3 *database;
    
    //Declaration de notre String qui sera retourne
    NSString *usernameString = [NSString string];
    
    SQLManager*sqlManager = [SQLManager sharedManager];
    
    // Ouverture de la base de donnees
    if(sqlite3_open([sqlManager.dataBasePath UTF8String], &database) == SQLITE_OK) {
        
        //REQUETE EN PARAMETRE
        
        //Chaine de caracteres de la requete
        const char *sqlStatement = "SELECT libelle, description FROM Exercice WHERE id = 1";
        
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
    
    //Retourne la valeur
    return usernameString;
    
    
    //return result;
}**/

// Permet de récupérer un exercice en fonction de son identifiant
-(Exercice*) GetExercice:(int)exId {
    
    Exercice*result = [[Exercice alloc] init];
    
    // get an exercice
    
    return result;
}

@end
