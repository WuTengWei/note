//
//  User.m
//  KVC&KVO
//
//  Created by wtw on 2018/12/11.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)init {
    self = [super init];
    if (self) {
//        _name = @"_name";
    }
    return self;
}

+ (BOOL)accessInstanceVariablesDirectly {
    return NO;
}


//- (void)setName:(NSString *)name {
//    _name = @"setName";
//}

//- (NSString *)getName{
//    return @"getName";
//}
//
//- (NSString *)name {
//    return @"name";
//}

@end
