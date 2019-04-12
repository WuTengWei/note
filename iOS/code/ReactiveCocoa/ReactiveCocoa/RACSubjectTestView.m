//
//  RACSubjectTestView.m
//  ReactiveCocoa
//
//  Created by wtw on 2018/12/5.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "RACSubjectTestView.h"
#import <ReactiveObjC/RACSubject.h>

@implementation RACSubjectTestView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        [_subject sendNext:@"点我啊"];
//        [_subject sendCompleted];
}

@end
