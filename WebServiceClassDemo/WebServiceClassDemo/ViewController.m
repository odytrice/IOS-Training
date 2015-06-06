//
//  ViewController.m
//  WebServiceClassDemo
//
//  Created by Ody Mbegbu on 6/6/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize dataList;
@synthesize image;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Get Url from string
    
    NSURL *myUrl = [NSURL URLWithString:@"http://www.prashantranjan.com/services.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:myUrl];
    
    dataList = [[NSMutableArray alloc]init];
    
    //Invoke URL
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSArray *myCompleteArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //Load Data into string
        for (NSDictionary *myDict in myCompleteArray) {
            NSString *myInfo = [myDict objectForKey:@"name"];
            [dataList addObject:myInfo];
            NSLog(@"Name: %@",myInfo);
        }
        [self.tableView reloadData];
    }];
    
    //Load Image
    NSURL *url = [NSURL URLWithString:@"http://prashantranjan.com/images/flower1.png"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    image = [[UIImage alloc]initWithData:data];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataList count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *simpleTableIdentifier = @"*";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = dataList[indexPath.row];
    cell.imageView.image = image;
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.textColor = [UIColor blackColor];
    if(indexPath.row % 2 == 0){
        cell.backgroundColor = [UIColor blueColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    return cell;
}

@end
