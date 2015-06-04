//
//  SecondController.m
//  MultiViewDemo
//
//  Created by Ody Mbegbu on 6/4/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import "SecondController.h"

@interface SecondController ()

@end

@implementation SecondController
@synthesize text;
@synthesize label;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    label.text = [NSString stringWithFormat:@"Hello %@",text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
