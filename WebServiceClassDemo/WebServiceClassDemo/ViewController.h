//
//  ViewController.h
//  WebServiceClassDemo
//
//  Created by Ody Mbegbu on 6/6/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (copy, nonatomic) NSMutableArray *dataList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) UIImage *image;
@end

