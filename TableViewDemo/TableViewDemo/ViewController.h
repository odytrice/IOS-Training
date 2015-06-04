//
//  ViewController.h
//  TableViewDemo
//
//  Created by Ody Mbegbu on 6/4/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (copy,nonatomic)NSArray *myValues;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

