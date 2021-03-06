//
//  TWBlock.m
//  Blocks
//
//  Created by wtw on 2019/1/3.
//  Copyright © 2019 wtw. All rights reserved.
//

#import "TWBlock.h"

@implementation TWBlock

//全局变量
int global_var = 4;
//静态全局变量
static int static_global_var = 5;

- (void)method {
    //基本数据类型的局部变量
    int var = 1;
    //对象类型的局部变量
    __unsafe_unretained id unsafe_obj = nil;
    __strong id strong_obj = nil;
    
    //局部静态变量
    static int static_var = 3;
    
    void(^Block)(void) = ^{
        NSLog(@"局部变量<基本数据类型> var %d",var);
        
        NSLog(@"局部变量<__unsafe_unretained 对象类型>  var %@",unsafe_obj);
        NSLog(@"局部变量<__strong 对象类型> var %@",strong_obj);
        
        NSLog(@"局部静态变量 %d",static_var);
        
        NSLog(@"全局变量 %d",global_var);
        NSLog(@"静态全局变量 %d",static_global_var);
    };
    
    Block();
}

@end
