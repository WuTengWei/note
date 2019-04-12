//
//  Son.m
//  Runtime使用
//
//  Created by wtw on 2018/9/17.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "Son.h"

@implementation Son

- (void)run {
    NSLog(@"Son run");
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}

/*
 class
 
 */

/*
 Runtime使用[41985:5053321] Son
 Runtime使用[41985:5053321] Son
 */


@end
