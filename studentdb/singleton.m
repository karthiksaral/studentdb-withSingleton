//
//  singleton.m
//  studentdb
//
//  Created by Admin on 8/6/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "singleton.h"
#import <sqlite3.h>

@implementation singleton
@synthesize scholna,studna,maak1,maak2,strURL,select,databasePath;

static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

+(id)share
{
    static singleton *sharein=nil;
    if(sharein==nil)
    {
        sharein=[[self alloc]init];
    }
    return sharein;
}

-(void)createDB
{
    NSArray *documentPaths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    NSString *documentDir = [documentPaths objectAtIndex:0];
    databasePath = [documentDir
                    stringByAppendingPathComponent:@"studdb.sqlite"];
    BOOL success;
    NSFileManager *fileManager = [NSFileManager
                                  defaultManager];
    success = [fileManager fileExistsAtPath:databasePath];
    if(success) return;
    NSString *databasePathFromApp = [[[NSBundle mainBundle]
                                      resourcePath]
                                     stringByAppendingPathComponent:@"studdb.sqlite"];
    NSError *error;
    if(![fileManager copyItemAtPath:databasePathFromApp
                             toPath:databasePath error:&error]) {
        NSLog(@"%@",[error localizedDescription]);
    }
}

-(void)insertValuesToTheDb:(NSString*)Query
{
    const char *dbpath=[databasePath UTF8String];
    if(sqlite3_open(dbpath, &database)==SQLITE_OK)
    {const char *stmnt=[Query UTF8String];
        NSLog(@"%s",stmnt);
        sqlite3_prepare(database, stmnt, -1, &statement,
                        NULL);
        sqlite3_step(statement);
        sqlite3_reset(statement);
    }
}


-(NSMutableArray *)fetchFromDB:(NSString*)Query

{
    NSMutableArray *arrObject=[[NSMutableArray alloc]init];
    
    const char *dbpath=[databasePath UTF8String];
    if(sqlite3_open(dbpath, &database)==SQLITE_OK)
    {
        
        const char *stmnt=[Query UTF8String];
        sqlite3_prepare(database, stmnt, -1, &statement,
                        NULL);
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSString* strObject=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement, 0)];
            [arrObject addObject:strObject];
            NSLog(@"%@",strObject);
        }
        sqlite3_reset(statement);
    }
    
    return arrObject;
}






-(NSString *)fetchValue:(NSString*)Query

{
    NSString *result;
    const char *dbpath=[databasePath UTF8String];
    if(sqlite3_open(dbpath, &database)==SQLITE_OK)
    {
        
        const char *stmnt=[Query UTF8String];
        sqlite3_prepare(database, stmnt, -1, &statement,
                        NULL);
        
        
        
        if(sqlite3_step(statement)==SQLITE_ROW)
        {
            result=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement, 0)];
            
        }
        
        
        sqlite3_reset(statement);
        
        
    }
    
    return result;
}



@end
