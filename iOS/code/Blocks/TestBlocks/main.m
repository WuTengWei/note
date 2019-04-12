//
//  main.m
//  TestBlocks
//
//  Created by wtw on 2018/12/17.
//  Copyright © 2018 wtw. All rights reserved.
//

#import <Foundation/Foundation.h>
//IMPL ： Initial Microprogram Loading

typedef int  (^blk_t)(int);
blk_t func(int rate) {
    return ^(int count) {
        return rate * count;
    };
}

int main () {

    func(10);
    
    return 0;
}
