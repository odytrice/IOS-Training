//
//  main.m
//  ProtocolDemo
//
//  Created by Ody Mbegbu on 6/4/15.
//  Copyright (c) 2015 Cyberspace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "MyClassB.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        MyClass *mClassA = [[MyClass alloc]init];
        [mClassA show];
        
        MyClassB *mClassB = [[MyClassB alloc]init];
        [mClassB show];
        [mClassB showOptn];
        
    }
    return 0;
}

