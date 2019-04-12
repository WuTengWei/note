//
//  Person.h
//  KVC&KVO
//
//  Created by wtw on 2018/12/12.
//  Copyright © 2018 wtw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    //_<key> _is<Key> <key> is<Key>
    NSString *_name;
    NSString *_isName;
    NSString *name;
    NSString *isName;
}
@end
