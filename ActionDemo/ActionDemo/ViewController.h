//
//  ViewController.h
//  ActionDemo
//
//  Created by Ody Mbegbu on 6/4/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIActionSheetDelegate>

- (IBAction)normalDialog:(UIButton *)sender;
- (IBAction)actionDialog:(UIButton *)sender;

@end

