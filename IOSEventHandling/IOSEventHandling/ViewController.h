//
//  ViewController.h
//  IOSEventHandling
//
//  Created by Ody Mbegbu on 6/3/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)changeText:(UIButton *)sender;
@end
