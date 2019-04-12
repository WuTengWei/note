//
//  Movie.h
//  Runtime使用
//
//  Created by wtw on 2018/8/20.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject<NSCoding>
@property (nonatomic,copy) NSString *movieId;
@property (nonatomic,copy) NSString *movieName;
@property (nonatomic,copy) NSString *pic_url;
@end
