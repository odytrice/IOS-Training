//
//  ViewController.m
//  GetImageDemo
//
//  Created by Ody Mbegbu on 6/6/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)downloadImage:(UIButton *)sender {
    
    //Display Loading
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    //Creating Second Thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
       //Statement
        NSURL *url = [NSURL URLWithString:@"https://www.google.com.ng/images/srpr/logo11w.png"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        [NSThread sleepForTimeInterval:1];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //What to update on foreground processing
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            imageView.image = [[UIImage alloc]initWithData:imageData];
        });
    });


}
@end
