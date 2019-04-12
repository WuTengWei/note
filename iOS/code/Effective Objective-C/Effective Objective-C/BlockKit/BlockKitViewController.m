//
//  BlockKitViewController.m
//  Effective Objective-C
//
//  Created by wtw on 2018/2/7.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "BlockKitViewController.h"
#import "BlocksKit.h"

@interface BlockKitViewController ()

@end

@implementation BlockKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
    NSString *str = [NSString stringWithFormat:@"*hello:areyo@uo&k#"];
    
    NSLog(@"%@",[str stringByTrimmingCharactersInSet:set]);
    
    //BlcoksKit 使用
    NSArray *arr = @[@1,@2,@3,@4,@5];
    [arr bk_each:^(id obj) {
        NSLog(@"each == %@",obj);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
