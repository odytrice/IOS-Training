//
//  ViewController.m
//  CustomUIDemo
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
    UIButton *mButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 120, 30)];
    [mButton setTitle:@"Click Me" forState:UIControlStateNormal];
    [mButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [mButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [mButton setBackgroundColor:[UIColor redColor]];
    
    mButton.clipsToBounds = true;
    mButton.layer.cornerRadius = 10;
    
    [mButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 120, 120)];

    [imgView setImage:[UIImage imageNamed:@"blue"]];
    
    //Making Animation
    imgView.animationImages = [NSArray arrayWithObjects:
                               [UIImage imageNamed:@"red"],
                               [UIImage imageNamed:@"green"],
                               [UIImage imageNamed:@"blue"]
                               ,nil];
    //Set the duration of animation
    imgView.animationDuration = 2.0;
    
    //Invoking Animation
    [imgView startAnimating];
    
    //Add  Controls to View
    [self.view addSubview:imgView];
    [self.view addSubview:mButton];
}

- (void) buttonClicked{
    NSLog(@"Button Clicked");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
