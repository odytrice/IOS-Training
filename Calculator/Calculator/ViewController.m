//
//  ViewController.m
//  Calculator
//
//  Created by Ody Mbegbu on 6/3/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize firstTextBox;
@synthesize secondTextBox;
@synthesize resultLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddButton:(UIButton *)sender {
    int a = firstTextBox.text.intValue;
    int b = secondTextBox.text.intValue;
    
    int result = a + b;
    
    resultLabel.text = [NSString stringWithFormat:@"%i",result];
    [self closeKeypad:sender];
}

- (IBAction)SubtractButton:(UIButton *)sender {
    int a = firstTextBox.text.intValue;
    int b = secondTextBox.text.intValue;
    
    int result = a - b;
    
    resultLabel.text = [NSString stringWithFormat:@"%i",result];
    [self closeKeypad:sender];
}

- (IBAction)MultiplyButton:(UIButton *)sender {
    int a = firstTextBox.text.intValue;
    int b = secondTextBox.text.intValue;
    
    int result = a * b;
    
    resultLabel.text = [NSString stringWithFormat:@"%i",result];
    [self closeKeypad:sender];
}

- (IBAction)Divide:(UIButton *)sender {
    
    int a = firstTextBox.text.intValue;
    int b = secondTextBox.text.intValue;
    
    int result = a / b;
    
    resultLabel.text = [NSString stringWithFormat:@"%i",result];
    [self closeKeypad:sender];
    
}

- (IBAction)closeKeypad:(id)sender {
    [firstTextBox resignFirstResponder];
    [secondTextBox resignFirstResponder];
}
@end
