//
//  ViewController.m
//  NSTimer使用注意事项
//
//  Created by wtw on 2018/8/28.
//  Copyright © 2018年 wtw. All rights reserved.
//

#import "ViewController.h"
#import "TimerViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
        
    //NSTimer 一个在确定时间间隔内执行一次或多次我们指定对象方法的对象
    /*
     定时器的基本使用：
     timerWithTimeInterval: target: selector: userInfo: repeats:;
     scheduledTimerWithTimeInterval: target: selector: userInfo: repeats:;
     区别:
     timerWithTimeInterval 需要手动添加到当前runloop中。
     scheduledTimerWithTimeInterval 不需要，自动就添加到了当前的runloop 中。
     
     
     fire : fire函数的作用是实时触发定时器，但不影响到NSTimer 自身的响应周期
     
     
     在子线程中使用 NSTimer 注意点 ：
     直接使用是没有反应的，因为runloop 在子线程上，需要手动去开启当前的runloop
     
     在子线程上创建的定时器，必须要在子线程中销毁，不要在主线程中销毁，否者会造成runloop 资源泄露
     runloop 的创建方式不是通过alloc init 是通过 [NSRunLoop currentRunLoop] 来直接获取的
     
     如果当前线程中有大量的复杂操作，会导致定时器的卡住
     
     
     定时器 在ScrollView 中使用注意点：
     当在scrollView 中滑动的时候，定时器会暂停，原因是默认的Timer 是在NSDefaultRunLoopMode ，但是在滑动的时候runloop是UITrackingRunLoopMode，
     runloop 同一时刻只能在一个mode 上来运行，其他 mode 上的任务暂停。
     所以在Timer 中最好是设置 mode为 NSRunLoopCommonModes ，因为NSRunLoopCommonModes 包含了 NSDefaultRunLoopMode 和 UITrackingRunLoopMode，所以滑动的时候也能响应定时器
     
     
     定时器的循环引用问题：
     
     
     */
    
//    [self regularTimer];
//    [self regularTimerTwo];
    
    //子线程中使用定时器
//    [NSThread detachNewThreadSelector:@selector(threadTimer) toTarget:self withObject:nil];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        //如果在当前线程有复杂的操作，会导致定时器卡住
//        [self busyCalculate];
//    });
}

//普通用法 1
- (void)regularTimer {
    _timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    //默认是 NSDefaultRunLoopMode
    //NSRunLoopCommonModes 包含了 NSDefaultRunLoopMode 和 UITrackingRunLoopMode，所以滑动的时候也能响应定时器
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
//普通用法 2
- (void)regularTimerTwo {
    //默认会自动添加到 NSDefaultRunLoopMode
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction {
    NSLog(@" === timerAction == ");
}

//NSTimer 在线程中的使用
- (void)threadTimer {
    NSLog(@"%@",[NSThread currentThread]);
    //直接调用是没有任何反应的
    //runloop 在子线程中是需要手动开启的
    _timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    
    //子线程上的定时器，必须要在子线程中销毁，不要在主线程中销毁，否者会造成runloop 资源泄露
    [self performSelector:@selector(invalidateTimer) withObject:nil afterDelay:3];
    
    //手动开启runoop
    [[NSRunLoop currentRunLoop] run];
    
    //runloop 的创建方式不是通过alloc init 是通过 [NSRunLoop currentRunLoop] 来直接获取的
    NSLog(@" === 子线程的timer 销毁了 === ");
}

//销毁定时器
- (void)invalidateTimer {
    [_timer invalidate];
    _timer = nil;
}

//如果在当前线程有复杂的操作，会导致定时器卡住
- (void)busyCalculate {
    NSUInteger count = 0xFFFFFFF;
    CGFloat num = 0;
    for (int i = 0; i < count; i ++) {
        num = i/count;
    }
}


#pragma mark - tablview 相关

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@" === %zd === ",indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //runloop 同一时刻只能在一个mode 上来运行，其他mode 上的任务暂停
    NSLog(@"runloop Mode %@",[NSRunLoop currentRunLoop].currentMode);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //fire函数的作用是实时触发定时器，但不影响到NSTimer 自身的响应周期
    //    [_timer fire];
    TimerViewController *tvc = [[TimerViewController alloc] init];
    [self.navigationController pushViewController:tvc animated:YES];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.dataSource =  self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
