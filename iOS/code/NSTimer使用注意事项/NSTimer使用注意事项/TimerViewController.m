//
//  TimerViewController.m
//  NSTimer使用注意事项
//
//  Created by wtw on 2018/8/28.
//  Copyright © 2018年 wtw. All rights reserved.
//https://www.cnblogs.com/beckwang0912/p/7027484.html
//https://blog.csdn.net/ggghub/article/details/51374150

#import "TimerViewController.h"
#import "NSTimer+RCTimer.h"
#import "RCProxy.h"

@interface TimerViewController ()
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) dispatch_source_t timerTwo;
@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    //销毁定时器的解决方案
    //1、在viewWillDisappear 中手动去销毁定时器
    
    //self ->timer ->self
    //timer 的销毁依赖self的delloc 方法里的invalidate ，self的销毁依赖于timer 的销毁所以会导致循环引用
    
    //runloop 对timer有强引用，weak 型的timer 是不会被释放的
    //runloop ->timer -> self  self -> timer
    
    
//    [self regularTimer];
    
//    [self gcdTimer:1.f repeats:YES];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:[RCProxy proxyWithTarget:self]
                                                selector:@selector(timerAction)
                                                userInfo:nil
                                                 repeats:YES];
    
}

- (void)regularTimer {
//    __weak typeof(self)weakSelf = self;  //weakSelf 无效
//    _timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    //_timer = nil;   //_timer 只是一个指针，指向定时器
    
    
    //引起循环引用的主要是 targrt:self
    //自己实现一个不保留目标的定时器
    __weak typeof(self)Weakself = self;
    _timer = [NSTimer timerWithTimeInterval:1.f block:^{
        [Weakself timerAction];
    } repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    
    //在iOS 10 之后系统提供了类似的block 方法来解决循环引用的问题
//    __weak typeof(self)Weakself = self;
//    _timer = [NSTimer timerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [Weakself timerAction];
//    }];
//    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [Weakself timerAction];
//    }];
    
}

- (void)gcdTimer:(NSTimeInterval)timeInterval repeats:(BOOL)repeats {
    //获取队列
    dispatch_queue_t queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建一个定时器（dispatch_source_t本质还是个OC对象，创建出来的对象需要强引用）
    _timerTwo = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置定时器的各种属性（什么时候开始任务，每隔多久执行一次）  GCD的时间参数，一般是纳秒（1秒 = 10的9次方纳秒）
    dispatch_source_set_timer(_timerTwo, DISPATCH_TIME_NOW, timeInterval * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    //设置回调
    dispatch_source_set_event_handler(_timerTwo, ^{
        if (!repeats) {
            dispatch_cancel(_timerTwo);  //取消定时器
            self.timerTwo = nil;
        }else {
            [self timerAction];
        }
    });
    //启动定时器
    dispatch_resume(_timerTwo);
    
    //只执行一次操作
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//    });
}

- (void)timerAction {
    NSLog(@" === timerAction == ");
}

- (void)dealloc {
    [_timer invalidate];
    _timer = nil;
    NSLog(@" _timer invalidate 销毁了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//可以手动在 viewWillDisappear 中去销毁定时器
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [_timer invalidate];
//    _timer = nil;
}

@end
