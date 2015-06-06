//
//  DataTableController.m
//  DatabaseClassDemo
//
//  Created by Ody Mbegbu on 6/5/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import "DataTableController.h"

@interface DataTableController ()

@end

@implementation DataTableController
{
    NSFileManager *fileMgr;
}

@synthesize databasePath;
@synthesize contactDB;
@synthesize dataList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //Get the path for document directory
    [self initDB];
    dataList = [self loadData];
}

-(void)viewDidAppear:(BOOL)animated{
    dataList = [self loadData];
    [self.tableView reloadData];
}

-(void) initDB{
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

-(NSMutableArray *) loadData{
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
    
    return  records;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [dataList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = dataList[indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
