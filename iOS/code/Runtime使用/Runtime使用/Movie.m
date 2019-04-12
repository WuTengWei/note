//
//  Movie.m
//  Runtime使用
//
//  Created by wtw on 2018/8/20.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "Movie.h"
#import <objc/runtime.h>

@implementation Movie

//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:_movieId forKey:@"id"];
//    [aCoder encodeObject:_movieName forKey:@"name"];
//    [aCoder encodeObject:_pic_url forKey:@"url"];
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super init]) {
//        self.movieId = [aDecoder decodeObjectForKey:@"id"];
//        self.movieName = [aDecoder decodeObjectForKey:@"name"];
//        self.pic_url = [aDecoder decodeObjectForKey:@"url"];
//    }
//    return self;
//}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([Movie class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        //查看成员变量
        const char *name = ivar_getName(ivar);
        //归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([Movie class], &count);
        for (int i = 0; i <count; i ++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            //归档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            //设置到成员变量身上
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

@end
