//
//  Person.m
//  Runtime使用
//
//  Created by wtw on 2018/8/19.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

//name 属性
//_name 实例变量
@synthesize name = _name;

- (NSString *)name {
    return _name;
}

- (void)setName:(NSString *)name {
    _name = name;
}
//没有返回值，1个参数
//void,(id,SEL)
void aaa(id self,SEL _cmd,NSNumber *meter) {
    NSLog(@"跑了%@米",meter);
}

//任何方法默认都有两个隐式参数，self,_cmd (当前方法的方法编号)
//什么时候调用: 只要一个对象调用了一个未实现的方法就会调用这个方法进行处理
//作用:动态添加方法，处理未实现
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == NSSelectorFromString(@"run:")) {
        //动态添加run方法
        //class : 给哪个类添加方法
        //SEL : 添加哪个方法，即添加方法的方法编号
        //IMP : 方法实现 => 函数 => 函数入口 => 函数名 (添加方法的函数实现(函数地址))
        //type : 方法类型（返回值 + 参数类型） v: void   @ : 对象-> self   : 表示SEL->_cmd
        NSLog(@"resolveInstanceMethod");
//        class_addMethod(self, sel, (IMP)aaa, "v@:@");
        return NO;
    }
    //返回父类的默认调用
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector");
    return  nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(run:)) {
        NSLog(@"methodSignatureForSelector");
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }else {
        return [super methodSignatureForSelector:aSelector];
    }
}


- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
}


@end
