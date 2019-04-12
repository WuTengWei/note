//
//  Person.m
//  KVC&KVO
//
//  Created by wtw on 2018/12/12.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

- (void)setValue:(id)value forKey:(NSString *)key {
    NSString *setter = [[@"set" stringByAppendingString:[key capitalizedString]] stringByAppendingString:@":"];
    NSLog(@"%@",setter);
    
    //1、检查是否存在setter
    if ([self respondsToSelector:NSSelectorFromString(setter)]) {
       //1.1、如果是标量型属性赋值，且值为nil ，赋值失败
        if (![value isKindOfClass:[NSObject class]] && value == nil) {
            [self setNilValueForKey:key];
        }else {
             //1.2、如果是对象指针类型，直接进行赋值操作
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelectorInBackground:NSSelectorFromString(setter) withObject:value];
#pragma clang diagnostic pop
        }
        //2、询问 accessInstanceVariablesDirectly 默认YES 继续往下寻找
    }else {
        //获取所有属性列表
        unsigned int count = 0;
        Ivar *ivar = class_copyIvarList([self class], &count);

        //_<key>, _is<Key>, <key>, or is<Key>  注意顺序!!!
        NSArray *searchPropretys = @[@"_name",@"_isName",@"name",@"isName"];

        //是否早到变量名的标志位，安段是否需要抛出异常
        BOOL flag = false;
        
        //遍历属性 依次匹配
        for (int i = 0; i < count; i ++) {
            //如果找到了 结束循环
            if (flag) {
                break;
            }else {
                Ivar var = ivar[i];
                NSString *name = [NSString stringWithUTF8String:ivar_getName(var)];
                for (int j = 0; j < searchPropretys.count; j++) {
                    //如果找到了 就结束循环
                    if ([name isEqualToString:searchPropretys[j]]) {
                        flag = YES;
                        object_setIvar(self, var, value);
                        break;
                    }
                }
            }
        }
        
        free(ivar);
        //如果没有找到 调用 setValue:forUndefinedKey: 抛出异常
        if (!flag) {
            [self setValue:value forUndefinedKey:key];
        }
    }
    
}

- (id)valueForKey:(NSString *)key
{
    // 1. 查找getter方法
    // -get<Key>
    NSString *getKey = [@"get" stringByAppendingString:[key capitalizedString]];
    NSString *isKey = [@"is" stringByAppendingString:[key capitalizedString]];
    //  1.1 优先查找 -get<Key>
    if ([self respondsToSelector:NSSelectorFromString(getKey)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:NSSelectorFromString(getKey)];
#pragma clang diagnostic pop
        // 1.2 查找   -<key>
    } else if ([self respondsToSelector:NSSelectorFromString(key)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:NSSelectorFromString(key)];
#pragma clang diagnostic pop
        // 1.3 查找 is<Key>
    }else if ([self respondsToSelector:NSSelectorFromString(isKey)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:NSSelectorFromString(isKey)];
#pragma clang diagnostic pop
        // 2. 询问 accessInstanceVariablesDirectly，是否继续查找属性，默认返回YES
    } else {
        //_<key>, _is<Key>, <key>, or is<Key>  注意顺序!!!
        //获取所有属性列表
        unsigned int count = 0;
        Ivar *ivar = class_copyIvarList([self class], &count);
        //_<key>, _is<Key>, <key>, or is<Key>  注意顺序!!!
        NSArray *searchPropretys = @[@"_name",@"_isName",@"name",@"isName"];
        BOOL flag  =  false;
        //遍历属性,依次匹配
        for (int i = 0; i < count; i++) {
            //如果找到了，跳出外重循环
            if (flag) {
                break;
            }else{
                Ivar var = ivar[i];
                NSString *name = [NSString stringWithUTF8String:ivar_getName(var)];
                for (int j = 0; j < searchPropretys.count; j++) {
                    //找到了，结束循环
                    if ([name isEqualToString:searchPropretys[j]]) {
                        flag = YES;
                        return  object_getIvar(self, var);
                        break;
                    }
                }
            }
        }
        free(ivar);
        //如果没找到，调用
        if (!flag) {
            [self valueForUndefinedKey:key];
        }
    }
    return nil;
}

+ (BOOL)accessInstanceVariablesDirectly {
    return NO;
}

@end
