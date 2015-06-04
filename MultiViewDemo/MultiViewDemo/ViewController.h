//
//  ViewController.h
//  MultiViewDemo
//
//  Created by Ody Mbegbu on 6/4/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textBox;

- (IBAction)switchView:(UIButton *)sender;

@end

