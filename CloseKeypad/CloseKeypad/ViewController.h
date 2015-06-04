//
//  ViewController.h
//  CloseKeypad
//
//  Created by Ody Mbegbu on 6/3/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
- (IBAction)closingKeypad:(UIButton *)sender;
- (IBAction)goneKeypad:(id)sender;

@end
