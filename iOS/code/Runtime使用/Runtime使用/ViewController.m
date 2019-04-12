//
//  ViewController.m
//  Runtime使用
//
//  Created by wtw on 2018/8/14.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Property.h"
#import "NSObject+Extention.h"
#import "Person.h"
#import "Son.h"
#import <objc/message.h>

@interface ViewController (){
    int a;
}
@property (nonatomic,strong) UIView *view;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
    Person *p = [[Person alloc] init];
    [p performSelector:@selector(run:) withObject:nil];
    Son *s = [[Son alloc] init];
    [s performSelector:@selector(run) withObject:nil];
    
        
    //字典转模型
//    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"RuntimeTest" ofType:@"plist"];
//    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filepath];
}

#pragma mark - Runtime 交换方法
- (void)testRuntimeExchangemethod {
    //Runtime 交换方法
    UIImage *img = [UIImage imageNamed:@"icon"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.frame = CGRectMake(50, 50, 50, 50);
    [self.view addSubview:imgView];
    
    //方案一：先搞个分类，定义一个能加载图片并且能打印的方法 + (instancetype)imageWithName:(NSString *)name;
    //方案二：交换imageNamed 和 tw_imageNamed 的实现，就能调用 imageNamed 间接调用 tw_imageNamed 的实现。
}

#pragma mark - 给分类添加属性
- (void)testCategoryAddIvar {
    //给分类添加属性
    NSObject *obj = [[NSObject alloc] init];
    obj.name = @"呵呵呵";
    NSLog(@"%@",obj.name);
}

#pragma mark - 动态添加方法
- (void)testRuntimeAddMethod {
    Person *p = [[Person alloc] init];
    //默认person 没有实现run:方法，可以通过performSelector 调用，但是会报错
    //动态添加方法就不会报错
    [p performSelector:@selector(run:) withObject:@10];
}

#pragma mark - 运行时生成一个类 为其添加属性和方法
- (void)testRuntimeClassPair {
    //1、在运行时动态生成一个类
    Class cls = objc_allocateClassPair([NSObject class], "RuntimeClass", 0);
    
    //2、为类添加方法和成员变量
    //给指定的类添加成员变量 ，只能在objc_allocateClassPair() 和 objc_registerClassPair() 之间调用，并且不能为一个已经存在的类添加成员变量
    class_addIvar(cls, "name", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
    class_addIvar(cls, "age", sizeof(int), sizeof(int), @encode(int));
    
    SEL sel = sel_registerName("RuntimeTestMethod");
    class_addMethod(cls, sel, (IMP)RuntimeTestMethodIMP, "i@:@");
    
    //3、注册类到Runtime
    objc_registerClassPair(cls);
    
    //使用创建的类
    //4、创建该类的实例，为新增的成员变量赋值
    id person = [[cls alloc] init];
    NSLog(@"实例所属的类: %@ ,实例所属的父类: %@",object_getClass(person),class_getSuperclass(object_getClass(person)));
    
    Ivar nameIvar = class_getInstanceVariable(cls, "name");
    object_setIvar(person, nameIvar, @"xiaohua");
    
    Ivar ageIvar = class_getInstanceVariable(cls, "age");
    object_setIvar(person, ageIvar, @18);
    NSLog(@"实例变量Person的值%@  %@",object_getIvar(person, nameIvar),object_getIvar(person, ageIvar));
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"xiaoli",@"name",@"25",@"age", nil];
    [person performSelector:@selector(RuntimeTestMethod) withObject:dic];
}

//动态添加的方法必须是已经实现的
void RuntimeTestMethodIMP(id self,SEL _cmd,NSDictionary *dict) {
    NSLog(@"传递进来的 dict%@",dict);
    NSLog(@"打印成员变量name: %@",object_getIvar(self, class_getInstanceVariable([self class], "name")));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
