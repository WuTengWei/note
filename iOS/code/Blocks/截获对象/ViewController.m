//
//  ViewController.m
//  截获对象
//
//  Created by wtw on 2019/1/14.
//  Copyright © 2019 wtw. All rights reserved.
//

#import "ViewController.h"

typedef void(^blk_t)(id);

@interface ViewController ()
{
    blk_t blk;
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Incompatible block pointer types assigning to '__strong blk_t' (aka 'void (^__strong)(void)') from 'void (^)(__strong id)'
    id array = [[NSMutableArray alloc] init];
    blk = [^(id obj){
        [array addObject:obj];
        NSLog(@"array count = %zd",[array count]);
    } copy];
    
    blk([[NSObject alloc] init]);
    blk([[NSObject alloc] init]);
    blk([[NSObject alloc] init]);
}


@end
