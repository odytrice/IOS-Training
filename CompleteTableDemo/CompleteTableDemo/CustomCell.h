//
//  CustomCell.h
//  CompleteTableDemo
//
//  Created by Ody Mbegbu on 6/5/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myCustomImage;
@property (weak, nonatomic) IBOutlet UILabel *myCustomName;
@property (weak, nonatomic) IBOutlet UILabel *myCustomDay;

@end
