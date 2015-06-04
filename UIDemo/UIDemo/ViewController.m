//
//  ViewController.m
//  UIDemo
//
//  Created by Ody Mbegbu on 6/3/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    bool isChecked;
}

@synthesize myValue;
@synthesize letter;
@synthesize whichSeg;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    whichSeg.text = @"First Seg Choosed";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeValue:(UISlider *)sender {
    int progress = sender.value;
    
    NSString *myRecVAlue = [NSString stringWithFormat:@"%i",progress];
    myValue.text = myRecVAlue;
    letter.alpha = sender.value / (sender.maximumValue - sender.minimumValue);
}

- (IBAction)checkSelected:(UIButton *)sender {
    if(isChecked){
        isChecked = false;
        [sender setSelected:false];
    }
    else{
        isChecked = true;
        [sender setSelected:true];
    }
}

- (IBAction)segChoose:(UISegmentedControl *)sender {
    int segIndex = sender.selectedSegmentIndex;
    switch (segIndex) {
        case 0:
            whichSeg.text = @"First Seg Choosed";
            break;
        case 1:
            whichSeg.text = @"Second Seg Choosed";
            break;
        default:
            whichSeg.text = @"Third Seg Choosed";
            break;
    }
}

- (IBAction)genAlert:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"My Alert Box" message:@"Success" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}
@end
