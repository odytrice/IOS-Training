//
//  ViewController.m
//  CloseKeypad
//
//  Created by Ody Mbegbu on 6/3/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTextField;

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

- (IBAction)closingKeypad:(UIButton *)sender {
    [myTextField resignFirstResponder];
}

- (IBAction)goneKeypad:(id)sender {
    [myTextField resignFirstResponder];    
}
@end
