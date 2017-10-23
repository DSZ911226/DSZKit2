//
//  DSZBaseModel.m
//  Demo
//
//  Created by zhilvmac on 2017/10/23.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import "DSZBaseModel.h"
#import <DSZKitMacro.h>
#import <MJExtension.h>
@implementation DSZBaseModel


/**
     MJExtension  function

 @return 需要替换的字段
 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self dsz_init];
    }
    return self;
}

- (void)dsz_init {
    DAssert(0)
    DSZLog(@"必须重写父类方法");
}

- (void)dealloc {
    DSZLog(@"DSZBaseModel");
}

@end
