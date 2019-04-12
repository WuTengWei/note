//
//  TwoViewController.h
//  Effective Objective-C
//
//  Created by wtw on 2018/2/6.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveObjC.h"

@interface TwoViewController : UIViewController

@property (nonatomic,strong) RACSubject *delegateSignal;

@end
