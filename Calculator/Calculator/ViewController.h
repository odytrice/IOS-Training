//
//  ViewController.h
//  Calculator
//
//  Created by Ody Mbegbu on 6/3/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstTextBox;
@property (weak, nonatomic) IBOutlet UITextField *secondTextBox;

- (IBAction)AddButton:(UIButton *)sender;
- (IBAction)SubtractButton:(UIButton *)sender;
- (IBAction)MultiplyButton:(UIButton *)sender;
- (IBAction)Divide:(UIButton *)sender;
- (IBAction)closeKeypad:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@end
