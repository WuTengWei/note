//
//  ViewController.m
//  RunLoopTest
//
//  Created by wtw on 2018/1/27.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,assign) NSInteger tickets;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSLog(@"currentMode == %@",[[NSRunLoop currentRunLoop] currentMode]);
    
//    NSLog(@"%@",[NSRunLoop currentRunLoop]);
//    [self observerTest];
//    [self runLoopModeTest];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _tickets = 5;
    //线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self saleTickets];
    });
    //线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self saleTickets];
    });
}

- (void)saleTickets{
    while (1) {
        [NSThread sleepForTimeInterval:1.0];
        if (_tickets > 0) {
            _tickets --;
            NSLog(@"剩余 = %ld Thread:%@",_tickets,[NSThread currentThread]);
        }
        NSLog(@"卖完了  Thread%@",[NSThread currentThread]);
        break;
    }
}




- (void)modeTestTimer {
    NSLog(@"mode:%@",[[NSRunLoop currentRunLoop] currentMode]);
}
/// 这里使用非主线程，主要考虑如果一直处于customMode模式，则主线瘫痪
- (void)runLoopModeTest {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSTimer *tickTimer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:2 target:self selector:@selector(modeTestTimer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:tickTimer forMode:@"customMode"];
        [[NSRunLoop currentRunLoop] runMode:@"customMode"  beforeDate:[NSDate distantFuture]];
    });
}

- (void)observerTest {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        /**
         param1: 给observer分配存储空间
         param2: 需要监听的状态类型:kCFRunLoopAllActivities监听所有状态
         param3: 是否每次都需要监听，如果NO则一次之后就被销毁，不再监听，类似定时器的是否重复
         param4: 监听的优先级，一般传0
         param5: 监听到的状态改变之后的回调
         return: 观察对象
         */
        CFRunLoopObserverRef  observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
            switch (activity) {
                case kCFRunLoopEntry:
                    NSLog(@"即将进入runloop");
                    break;
                case kCFRunLoopBeforeTimers:
                    NSLog(@"即将处理timer");
                    break;
                case kCFRunLoopBeforeSources:
                    NSLog(@"即将处理input Sources");
                    break;
                case kCFRunLoopBeforeWaiting:
                    NSLog(@"即将睡眠");
                    break;
                case kCFRunLoopAfterWaiting:
                    NSLog(@"从睡眠中唤醒，处理完唤醒源之前");
                    break;
                case kCFRunLoopExit:
                    NSLog(@"退出");
                    break;
                default:
                    break;
            }
        });
        // 没有任何事件源则不会进入runloop
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(doFireTimer) userInfo:nil repeats:NO];
        CFRunLoopAddObserver([[NSRunLoop currentRunLoop] getCFRunLoop], observer, kCFRunLoopDefaultMode);
        [[NSRunLoop currentRunLoop] run];
    });
}

- (void)doFireTimer {
    NSLog(@"---fire---");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    @throw [NSException exceptionWithName:@"12345" reason:@"56789" userInfo:nil];
//}

@end
