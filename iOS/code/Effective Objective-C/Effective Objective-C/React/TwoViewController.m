//
//  TwoViewController.m
//  Effective Objective-C
//
//  Created by wtw on 2018/2/6.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSStringFromClass([self class]);
}

- (IBAction)sendClick {
    if (self.delegateSignal) {
        [self.delegateSignal sendNext:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
