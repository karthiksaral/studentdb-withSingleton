//
//  singleton.h
//  studentdb
//
//  Created by Admin on 8/6/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface singleton : NSObject
{
    NSString *scholna;
    NSString *studna;
    NSString *maak1;
    NSString *maak2;
    NSString *strURL;
    NSString *select;
  
    
}


@property(strong,nonatomic)NSString *databasePath;
@property(strong,nonatomic)NSString *scholna;
@property(strong,nonatomic)NSString *studna;
@property(strong,nonatomic)NSString *maak1;
@property(strong,nonatomic)NSString *maak2;

@property(strong,nonatomic)NSString *strURL;
@property(strong,nonatomic)NSString *select;

+(id)share;
-(void)createDB;
-(void)insertValuesToTheDb:(NSString*)Query;
-(NSMutableArray *)fetchFromDB:(NSString*)Query;
-(NSString *)fetchValue:(NSString*)Query;


@end
