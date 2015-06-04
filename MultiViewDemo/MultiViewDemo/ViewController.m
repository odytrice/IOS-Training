//
//  ViewController.m
//  MultiViewDemo
//
//  Created by Ody Mbegbu on 6/4/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textBox;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchView:(UIButton *)sender {
    SecondController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Second"];
    svc.text = textBox.text;
    [self presentViewController:svc animated:true completion:nil];
}
@end
