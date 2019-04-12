//
//  ViewController.m
//  Blocks
//
//  Created by wtw on 2018/12/12.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "ViewController.h"

typedef void(^blk_t)(void);

@interface ViewController ()
{
    blk_t blk_;
}
@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
//    NSURLConnection;
//    pthread_self();
    
    static int a = 0;
    blk_ = ^{
         a = 20;
        NSLog(@"self = %@ == %d",self,a);
    };
    
    NSArray *arr = [NSArray arrayWithObjects:@1,@2,@3, nil];
    NSLog(@"%@",arr);
    
    return self;
}

- (void)dealloc {
    NSLog(@"dealloc");
}


- (NSArray *)getBlockArray {
    int val = 10;
    return [[NSArray alloc] initWithObjects:
            ^{
                NSLog(@"123 %d",val);
            },
            ^{
                NSLog(@"123 %d",val);
            },nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    typedef void (^blk_t)(void);
//    blk_t blk = [[self getBlockArray] firstObject];
//    blk();
    
    __block int val = 0;
    void (^blk)(void) = [^{
        ++val;
    } copy];
    ++val;
    blk();
    NSLog(@"%d",val);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
