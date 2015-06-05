//
//  ViewController.h
//  DatabaseClassDemo
//
//  Created by Ody Mbegbu on 6/5/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *myInput;
@property (strong,nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;
- (IBAction)saveData:(UIButton *)sender;
- (IBAction)viewData:(UIButton *)sender;
@end

