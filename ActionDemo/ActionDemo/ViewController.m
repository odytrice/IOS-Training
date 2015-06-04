//
//  ViewController.m
//  ActionDemo
//
//  Created by Ody Mbegbu on 6/4/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)normalDialog:(UIButton *)sender {
    UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"Normal Dialog" message:@"Successful" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [myAlert show];
}

- (IBAction)actionDialog:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"My Action Sheet" delegate:self cancelButtonTitle:@"Ok" destructiveButtonTitle:@"Cancel" otherButtonTitles:nil,nil];
    [actionSheet addButtonWithTitle:@"First Button"];
    [actionSheet addButtonWithTitle:@"Second Button"];
    [actionSheet addButtonWithTitle:@"Third Button"];
    [actionSheet showInView:self.view];
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Cancel Clicked");
            break;
        case 1:
            NSLog(@"Ok Clicked");
            break;
        default:
            break;
    }
}
@end
