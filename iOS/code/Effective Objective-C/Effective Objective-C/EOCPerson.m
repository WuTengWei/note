//
//  EOCPerson.m
//  Effective Objective-C
//
//  Created by wtw on 2018/1/30.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "EOCPerson.h"

@implementation EOCPerson

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ : %p, \"%@ %@\">", [self class], self, _firstName, _lastName];
}

@end
