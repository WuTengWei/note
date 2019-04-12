//
//  NSObject+Property.h
//  Runtime使用
//
//  Created by wtw on 2018/8/17.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)
//只会生成get 和 sey 方法声明，不会生成实现，也不会生成下划线成员属性
@property (nonatomic,copy) NSString *name;
@end
