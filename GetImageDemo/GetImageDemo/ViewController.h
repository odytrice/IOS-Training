//
//  ViewController.h
//  GetImageDemo
//
//  Created by Ody Mbegbu on 6/6/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)downloadImage:(UIButton *)sender;
@end

