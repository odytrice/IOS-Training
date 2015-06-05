//
//  ViewController.h
//  CompleteTableDemo
//
//  Created by Ody Mbegbu on 6/5/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (copy,nonatomic) NSArray *myDemoList;

@end

