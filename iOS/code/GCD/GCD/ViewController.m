//
//  ViewController.m
//  GCD
//
//  Created by wtw on 2018/12/21.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSArray *listArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    dispatch_queue_t serialQueue1 = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t serialQueue2 = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t serialQueue3 = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
//
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_async(serialQueue1, ^{
//        NSLog(@"1");
//    });
//    dispatch_async(serialQueue2, ^{
//        NSLog(@"2");
//    });
//    dispatch_async(serialQueue3, ^{
//        NSLog(@"3");
//    });

//    [self testTargetQueue];
    
//    NSLog(@"%@",[NSDate date]);
//    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1000ull*USEC_PER_SEC);
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//        NSLog(@"%@",[NSDate date]);
//    });
    
//    dispatch_queue_t  queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_group_t group = dispatch_group_create();
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"1");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"2");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"3");
//    });
//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"执行完了");
//    });
    
    
//    dispatch_queue_t  queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_group_t group = dispatch_group_create();
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"1");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"2");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"3");
//    });
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
//    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2ull*NSEC_PER_SEC);
//    dispatch_queue_t  queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_group_t group = dispatch_group_create();
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"1");
//    });
//    dispatch_group_async(group, queue, ^{
//        [NSThread sleepForTimeInterval:3];
//        NSLog(@"2");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"3");
//    });
//    long result = dispatch_group_wait(group, time);
//    if (result == 0) {
//        //属于Dispatch Group 的全部处理执行结束
//        NSLog(@"执行完了");
//    }else {
//        //属于Dispatch Group 的某一个处理还在执行中
//        NSLog(@"没执行完呢");
//    }
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_TARGET_QUEUE_DEFAULT, 0);
//    dispatch_async(queue, ^{NSLog(@"0读取数据"); });
//    dispatch_async(queue, ^{NSLog(@"1读取数据"); });
//    dispatch_async(queue, ^{NSLog(@"2读取数据"); });
//    dispatch_async(queue, ^{NSLog(@"3读取数据"); });
//    dispatch_barrier_async(queue, ^{NSLog(@"写入数据");});
//    dispatch_async(queue, ^{NSLog(@"4读取数据"); });
//    dispatch_async(queue, ^{NSLog(@"5读取数据"); });
//    dispatch_async(queue, ^{NSLog(@"6读取数据"); });
//    dispatch_async(queue, ^{NSLog(@"7读取数据"); });
    
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_sync(queue, ^{
//        for (int i = 0; i < 10000; i ++) {
//            NSLog(@"%zd",i);
//        }
//        //处理
//        NSLog(@"dispatch_sync");
//         });
    
    
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    dispatch_sync(queue, ^{
//        NSLog(@"dispatch_sync");
//    });
    
//    dispatch_queue_t queueu = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_apply(10, queueu, ^(size_t index) {
//      NSLog(@"%zu",index);
//    });
//   NSLog(@"done");

//    NSArray *array = @[@1,@2,@3,@4,@5];
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_TARGET_QUEUE_DEFAULT, 0);
//    //在 Global Dispatch Queue 中非同步执行
//    dispatch_async(queue, ^{
//        //Global Dispatch Queue 等待 dispatch_apply 函数中全部处理执行结束
//        dispatch_apply([array count], queue, ^(size_t index) {
//            //并行处理包含在array 对象的全部对象
//            NSLog(@"index %zu : %@",index,[array objectAtIndex:index]);
//        });
//        // dispatch_apply 函数中的处理全部执行结束
//        // 在 Main Dispatch Queue 中非同步执行
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //在 Main Dispatch Queue 中执行处理用户界面更新
//            NSLog(@"done");
//        });
//    });
    
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_TARGET_QUEUE_DEFAULT, 0);
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//     for (int i=0; i < 1000; ++i) {
//           dispatch_async(queue, ^{
//           [array addObject:[NSNumber numberWithInteger:i]];
//        });
//     }

//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_TARGET_QUEUE_DEFAULT, 0);
//    //生成 Dispatch Semaphore
//    //Dispatch Semaphore 的计数初始值设定为 1
//    //保证可访问 NSMutableArray 类对象的线程同时只能有1个
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 1000; ++i) {
//        dispatch_async(queue, ^{
//            //等待 Dispatch Semaphore一直等待，直到 Dispatch Semaphore 的技术值达到大于等于 1。
//            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//            //由于 Dispatch Semaphore 的技术值达到大于等于 1
//           //所以将 Dispatch Semaphore 的计数值减去 1
//           //dispatch_semaphore_wait 函数执行返回
//           //即执行到此时的 Dispatch Semaphore 的计数值恒为0
//           //由于可访问 NSMutableArray 类对象的线程 只有 1个 ，一次你可以安全地进行更新
//            [array addObject:[NSNumber numberWithInteger:i]];
//            // 排他控制处理结束，所以通过 dispatch_semaphore_signal 函数将 Dispatch Semaphore 的计数值加1.
//            //如果有通过 dispatch_semaphore_signal 函数等待 Dispatch Semaphore 的计数值增加的线程，就由最先等待的线程执行。
//            dispatch_semaphore_signal(semaphore);
//        });
//    }
    
    
//    static int initialized = NO;
//    if (initialized == NO) {
//        //初始化
//        initialized = YES;
//    }
    
//    static dispatch_once_t pred;
//    dispatch_once(&pred, ^{
//        //初始化
//    });
    
    //NSHashTable;
//    NSMapTable
    //NSPointerArray
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"2" forKey:@"3"];
    NSLog(@"%@ == %ld",dict,[dict hash]);
}


- (void)testTargetQueue {
    dispatch_queue_t targetQueue = dispatch_queue_create("test.target.queue", DISPATCH_QUEUE_SERIAL);
    
    
    
    dispatch_queue_t queue1 = dispatch_queue_create("test.1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("test.2", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue3 = dispatch_queue_create("test.3", DISPATCH_QUEUE_SERIAL);
    
    dispatch_set_target_queue(queue1, targetQueue);
    dispatch_set_target_queue(queue2, targetQueue);
    dispatch_set_target_queue(queue3, targetQueue);
    
    dispatch_async(queue1, ^{
        NSLog(@"1 in");
        [NSThread sleepForTimeInterval:3.f];
        NSLog(@"1 out");
    });
    dispatch_async(queue2, ^{
        NSLog(@"2 in");
        [NSThread sleepForTimeInterval:3.f];
        NSLog(@"2 out");
    });
    dispatch_async(queue3, ^{
        NSLog(@"3 in");
        [NSThread sleepForTimeInterval:3.f];
        NSLog(@"3 out");
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)listArr {
    if (!_listArr) {
        _listArr = [NSArray arrayWithObjects:@1,@3,@4,@5,@6, nil];
    }
    return _listArr;
}

@end
