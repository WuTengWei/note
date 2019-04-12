//
//  UIImage+Image.m
//  Runtime使用
//
//  Created by wtw on 2018/8/14.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>

@implementation UIImage (Image)

/** 测试 runtime 交换方法
 load方法: 把类加载进内存时候调用，只会调用一次
 方法应先交换，再去调用
 */
+ (void)load {
    //1、获取 imageNamed 方法地址
    // class_getClassMethod 获取某个类的方法
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    //2、获取 tw_iamgeNamed 方法地址
    Method tw_imageNamedMethod = class_getClassMethod(self, @selector(tw_imageNamed:));
    //3、交换方法地址，相当于交换实现方式   method_exchangeImplementations 交换两个方法的实现
    method_exchangeImplementations(imageNamedMethod, tw_imageNamedMethod);
}

/**
 以下代码是不会有死循环的
 调用 imageNamed => tw_imageNamed
 调用 tw_imageNamed => imageNamed
 */
+ (UIImage *)tw_imageNamed:(NSString *)name {
    UIImage *image = [UIImage tw_imageNamed:name];
    if (image) {
        NSLog(@"加载成功");
    }else {
        NSLog(@"加载失败");
    }
    return image;
}

//不能在分类中重写系统方法 imageNamed ，因为会把系统的功能给覆盖掉，而且分类中不能调用super。
//所以第二步，我们要自己实现一个带有扩展功能的方法。

@end
