//
//  ViewController.h
//  UIDemo
//
//  Created by Ody Mbegbu on 6/3/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *myValue;
@property (weak, nonatomic) IBOutlet UILabel *letter;
@property (weak, nonatomic) IBOutlet UILabel *whichSeg;
@property (weak, nonatomic) IBOutlet UIButton *checkbox;
- (IBAction)changeValue:(UISlider *)sender;
- (IBAction)checkSelected:(UIButton *)sender;
- (IBAction)segChoose:(UISegmentedControl *)sender;
- (IBAction)genAlert:(UIButton *)sender;
@end
