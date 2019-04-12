//
//  OneViewController.m
//  Effective Objective-C
//
//  Created by wtw on 2018/2/6.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ReactiveObjC.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSStringFromClass([self class]);
}

- (IBAction)buttonClick {
    
    TwoViewController *v = [[TwoViewController alloc] init];
    
    //设置代理信号
    v.delegateSignal = [RACSubject subject];
    
    //订阅代理信号
    [v.delegateSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"点击了通知按钮");
    }];
    
    [self.navigationController pushViewController:v animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
