//
//  DataTableController.h
//  DatabaseClassDemo
//
//  Created by Ody Mbegbu on 6/5/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface DataTableController : UITableViewController
@property (strong,nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;
@property (copy,nonatomic) NSMutableArray *dataList;
@end
