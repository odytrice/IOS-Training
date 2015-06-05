//
//  ViewController.m
//  DatabaseClassDemo
//
//  Created by Ody Mbegbu on 6/5/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSFileManager *fileMgr;
}

@synthesize databasePath;
@synthesize contactDB;
@synthesize myInput;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Get the path for document directory
    
    NSArray *dirpaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentPath = dirpaths[0];
    
    NSLog(@"Document Path: %@",documentPath);
    
    //Append the path according to database name
    
    databasePath = [documentPath stringByAppendingPathComponent:@"contactsDB.db"];
    
    NSLog(@"New Path: %@",databasePath);
    
    //Initialize object of File Manager
    
    fileMgr = [NSFileManager defaultManager];
    
    if([fileMgr fileExistsAtPath:databasePath] == NO){
        NSString *createTable = @"CREATE TABLE IF NOT EXISTS MYTABLE(ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT)";
        //Conversion of String into Character *
        
        const char *dbPath = [databasePath UTF8String];
        const char *create_tabl = [createTable UTF8String];
        char *errMsg;
        
        if(sqlite3_open(dbPath, &contactDB) == SQLITE_OK){
            //Creating Table
            if(sqlite3_exec(contactDB, create_tabl, nil, nil, &errMsg) == SQLITE_OK){
                NSLog(@"Table Created");
            }
            else{
                NSLog(@"Table Created");
                NSAssert(0,@"Error of Database %s.",errMsg);
            }
        }
    }
    else{
        NSLog(@"Table already Created");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(UIButton *)sender {
    //Take Statement for insert query
    sqlite3_stmt *statement;
    
    //Createing query for insertion
    NSString *insert_query = [NSString stringWithFormat:@"INSERT INTO MYTABLE (NAME) VALUES (\"%@\")", myInput.text];
    
    //Changing path into char *
    const char *dbPath = [databasePath UTF8String];


    //Opening Database Path
    
    if([fileMgr fileExistsAtPath:databasePath] == YES)
    {
        if(sqlite3_open(dbPath, &contactDB) == SQLITE_OK){
            const char *inst_qry = [insert_query UTF8String];
            
            //Prepare the statement
            sqlite3_prepare_v2(contactDB, inst_qry, -1, &statement, nil);
            
            //Execute the statement
            if(sqlite3_step(statement) == SQLITE_DONE){
                NSLog((@"Record Inserted"));
            }
            else{
                NSLog(@"Record not Inserted");
            }
        }
        else{
            NSLog(@"Database not Found");
        }
    }
    else{
        NSLog(@"File not found");
    }
}

- (IBAction)viewData:(UIButton *)sender {
    //Take Statement for insert query
    sqlite3_stmt *statement;
    
    //Createing query for insertion
    NSString *insert_query = [NSString stringWithFormat:@"SELECT NAME FROM MYTABLE"];
    
    //Changing path into char *
    const char *dbPath = [databasePath UTF8String];
    
    NSMutableArray *records = [[NSMutableArray alloc]init];
    
    //Opening Database Path
    
    if([fileMgr fileExistsAtPath:databasePath] == YES)
    {
        if(sqlite3_open(dbPath, &contactDB) == SQLITE_OK){
            const char *inst_qry = [insert_query UTF8String];
            
            //Prepare the statement
            sqlite3_prepare_v2(contactDB, inst_qry, -1, &statement, nil);
            
            //Execute the statement
            while(sqlite3_step(statement) == SQLITE_ROW){
                //Add Record to the Database
                NSString *myData = [NSString stringWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                [records addObject:myData];
            }
            
            //Trigger Segue
            
        }
        else{
            NSLog(@"Database not Found");
        }
    }
    else{
        NSLog(@"File not found");
    }
}
@end
