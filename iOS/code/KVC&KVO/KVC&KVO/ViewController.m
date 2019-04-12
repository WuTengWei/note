//
//  ViewController.m
//  KVC&KVO
//
//  Created by wtw on 2018/12/11.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "Person.h"

@interface ViewController ()
{
    User *_u;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //methodForSelector 返回一个执行方法实现的指针 ，并且可以使用该指针直接调用方法的实现
    //使用methodForSelector:来避免动态绑定将减少大部分消息的开销，但是这只有在指定的消息被重复发送很多次时才有意义
    
    //用不明确的方法 对属性进行操作
    
    Person *p = [[Person alloc] init];
    [p setValue:@"123" forKey:@"name"];
    
//    _u = [[User alloc] init];
//    [_u setValue:@"xiaoli" forKey:@"name"];
//    NSLog(@"%@",str);
    
//    NSDictionary *dict = @{@"name":@"xiaoming",@"age":@"20",@"height": @"180",@"weight":@"120"};
//    //dictionaryWithValuesForKeys 根据一组指定的key ，获取到一组value 并且以字典的形式返回
//    NSDictionary *d = [dict dictionaryWithValuesForKeys:@[@"name",@"age",@"height"]];
//    NSLog(@"%@ == %@",dict,d);
//
//    //
//    User *user = [[User alloc] init];
//    [user setValuesForKeysWithDictionary:dict];
//    NSLog(@"%@ == %@ == %@ == %@ ",user.name,user.age,user.height,user.weight);
    
    /**
     KVC 在通过 key 或者 keyPath 进行操作的时候，可以查找属性方法、成员变量等，查找的时候可以兼容多种命名；
     在 KVC 的实现中，依赖 setter 和 getter 的方法实现，所以方法命名应该符合苹果的规范，否则会导致失败；
    
     //表示是否允许读取实例变量的值，YES 则在查找过程中从内存中读取实例变量的值
     @property (class, readonly) BOOL accessInstanceVariablesDirectly;

     **/
    
    
    //提供了通用的访问方法：
    //setter -> setValue:forKey
    //getter -> ValueForKey:
    // 这两个方法各个类通用，并且由KVC 提供默认的实现，也可以重写对应的方法来改变实现；
    
    //先找相关方法，再找相关变量
    //1、先是找相关方法，如果相关方法找不到
    //2、那么去判断 accessInstanceVariablesDirectly 是否返回 YES
    //3.1 如果返回 NO 直接执行 KVC 的ValueForUndefinedKey (系统抛出一个异常)
    //3.2 如果是 YES 继续再去找相关变量
    
    
    //集合操作符
    
    //隐藏方法 @max @min @sum @avg  @count
    
    //属性 就是变量 和方法 的 封装
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
