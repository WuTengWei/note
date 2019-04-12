//
//  ViewController.m
//  AFNetworkingAnalyse
//
//  Created by wtw on 2018/12/3.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    [serializer setTimeoutInterval:20];
//    manager.responseSerializer = [AFJSONResponseSerializer new];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [manager GET:@"https://www.baidu.com"
      parameters:@{@"key":@"value"}
        progress:^(NSProgress * _Nonnull downloadProgress) {
                                   NSLog(@"downloadProgress == %@",downloadProgress);
                               }
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    NSLog(@"task = %@  =😝😝\nresponseObject = %@ 😝😝",task,responseObject);
                                }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    NSLog(@"%@  == %@ ",task,error);
                                }];
}

@end
