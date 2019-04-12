//
//  RCProxy.h
//  NSTimer使用注意事项
//
//  Created by wtw on 2018/8/30.
//  Copyright © 2018年 wtw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCProxy : NSProxy
@property (nonatomic, weak, readonly) id target;
-(instancetype)initWithTarget:(id)target;
+(instancetype)proxyWithTarget:(id)target;
@end
